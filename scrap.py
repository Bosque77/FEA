import numpy as np

node_1=np.array([2,0,0])
node_2 = np.array([2,0,-1])
node_3 = np.array([2,1,0])

uv_1 = node_2 - node_1
uv_1_mag = np.linalg.norm(uv_1)
UV_1 = uv_1 / uv_1_mag

uv_2 = node_3 - node_1
uv_2_mag = np.linalg.norm(uv_2)
UV_2 = uv_2 / uv_2_mag

UV_3 = np.cross(uv_1, uv_2)

T = np.matrix([[UV_1[0], UV_2[0], UV_3[0], node_1[0]], [UV_1[1], UV_2[1], UV_3[1], node_1[1]],[UV_1[2], UV_2[2], UV_3[2], node_1[2]], [0, 0, 0, 1]])

H = np.linalg.inv(T)

test_v = np.array([[3],[0.5],[0],[1]])

result = H*test_v

print("placeholder")