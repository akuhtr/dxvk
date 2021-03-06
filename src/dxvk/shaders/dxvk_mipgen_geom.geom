#version 450

layout(points) in;
layout(triangle_strip, max_vertices = 4) out;

layout(location = 0) in  int  i_instance[1];
layout(location = 0) out vec3 o_pos;

const vec4 g_vpos[4] = {
  vec4(-1.0f, -1.0f, 0.0f, 1.0f),
  vec4(-1.0f,  1.0f, 0.0f, 1.0f),
  vec4( 1.0f, -1.0f, 0.0f, 1.0f),
  vec4( 1.0f,  1.0f, 0.0f, 1.0f),
};

void main() {
  for (int i = 0; i < 4; i++) {
    o_pos       = vec3(0.5f + 0.5f * g_vpos[i].xy, float(i_instance[0]));
    gl_Position = g_vpos[i];
    gl_Layer    = i_instance[0];
    EmitVertex();
  }
  
  EndPrimitive();
}