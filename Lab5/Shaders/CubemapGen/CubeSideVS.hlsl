cbuffer TransformData: register(b0)
{
    float4x4 viewProjectionMatrix;
};

struct VS_INPUT {
    float3 position : POSITION;
};

struct VS_OUTPUT {
    float4 position : SV_POSITION;
    float3 localPos : POSITION;
};

VS_OUTPUT main(VS_INPUT vsInput)
{
    VS_OUTPUT output = (VS_OUTPUT)0;
    output.position = mul(viewProjectionMatrix, float4(vsInput.position, 1.0f));
    output.localPos = vsInput.position;
    return output;
}