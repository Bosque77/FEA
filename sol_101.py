from typing import TextIO
import numpy as np

class SOL_101:
    BIN1 = 0
    BIN2 = 8
    BIN3 = 16
    BIN4 = 24
    BIN5 = 32
    BIN6 = 40
    BIN7 = 48
    BIN8 = 56
    BIN9 = 64

    def __init__(self,dmig_file):
        self.dmig_file = dmig_file

    # Generating the mass, stiffness, and loads matrices from the DMIG
    def generateDmigVariables(self):
        node_dof_list=[]
        file = open(self.dmig_file, "r")  # type: TextIO

        # Forming the stiffness matrix.
        # This code goes the the KAAX section in the DMIG and formulates the stiffness matrix
        line_1 = file.readline()
        matrix_size = int(line_1[self.BIN9:])
        s = (matrix_size,matrix_size)
        stiffness_matrix = np.zeros(s)
        current_line = file.readline()
        line_type_indicator = current_line[self.BIN2:self.BIN3]
        while line_type_indicator != "MAAX    ":
            if line_type_indicator == "KAAX    ":
                node = current_line[self.BIN5:self.BIN6]
                dof = current_line[self.BIN7:self.BIN8]
                node_dof = (node,dof)
                node_dof_list.append(node_dof)
                if 'row' in locals():
                    row = row+1
                else:
                    row = 0
            else:
                # finding the position of the stiffness matrix position using the node_dof and column
                node = current_line[self.BIN3:self.BIN4]
                dof = current_line[self.BIN5:self.BIN6]
                current_stiffness = current_line[self.BIN6:self.BIN8]
                current_node_dof = (node,dof)
                col = node_dof_list.index(current_node_dof)
                stiffness_matrix[row,col] = current_stiffness
            current_line = file.readline()
            line_type_indicator = current_line[self.BIN2:self.BIN3]

        # Forming the mass matrix
        # This code goes the the MAAX section in the DMIG and formulates the mass matrix
        matrix_size = int(current_line[self.BIN9:])
        s = (matrix_size,matrix_size)
        mass_matrix = np.zeros(s)
        current_line = file.readline()
        while line_type_indicator != "PAX     ":
            if line_type_indicator == "MAAX    ":
                node_row = current_line[self.BIN5:self.BIN6]
                dof_row = current_line[self.BIN7:self.BIN8]
            else:
                # finding the position of the mass matrix position using the node_dof and column
                node_col = current_line[self.BIN3:self.BIN4]
                dof_col = current_line[self.BIN5:self.BIN6]
                current_mass = current_line[self.BIN6:self.BIN8]
                current_node_dof_row = (node_row, dof_row)
                current_node_dof_col = (node_col, dof_col)
                row = node_dof_list.index(current_node_dof_row)
                col = node_dof_list.index(current_node_dof_col)
                mass_matrix[row, col] = current_mass
            current_line = file.readline()
            line_type_indicator = current_line[self.BIN2:self.BIN3]

        # Forming the load vector
        # This code goes the the PAX section in the DMIG and formulates the load vector
        vector_size = len(node_dof_list)
        s=(vector_size,1)
        load_vector = np.zeros(s)
        current_line = file.readline()
        current_line = file.readline()
        while line_type_indicator != "TUG1    ":
            node_row = current_line[self.BIN3:self.BIN4]
            dof_row = current_line[self.BIN5:self.BIN6]
            current_load = current_line[self.BIN6:self.BIN8]
            current_node_dof_row = (node_row, dof_row)
            row = node_dof_list.index(current_node_dof_row)
            load_vector[row] = current_load
            current_line = file.readline()
            line_type_indicator = current_line[self.BIN2:self.BIN3]
        return [mass_matrix,stiffness_matrix,load_vector]

    def getNodalDisplacements(self,K,F):
        K_inv = np.linalg.inv(K)
        nodal_displacements = np.matmul(K_inv,F)
        return nodal_displacements

from sol_101 import *
solver = SOL_101('DMIG.pch')
[M,K,F] = solver.generateDmigVariables()
[nodal_displacements] = solver.getNodalDisplacements(K,F)
print("placeholder")