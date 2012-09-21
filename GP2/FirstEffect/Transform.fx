float4*4 matWorld:WORLD;
floar4*4 matView:VIEW;
float4*4 matProjection:PROJECTION;

struct VS_IPNUT
{
	float4 pos:POSITION;
};

struct PS_INPUT
{
	float4 pos:SV_POSITION;
};

PS_INPUT VS(VS_INPUT input)
{
	PS_INPUT output=(PS_INPUT)0;
	
	float4*4 matViewProjection=mul(matView,matProjection);
	float4*4 matWorldViewProjection=mul(matWorlld,matViewProjection);
	
	output.pos=mul(input.pos,matWorldViewProjection);
	return output;
}

float4 PS(PS_INPUT input);SV_TARGET
{
	return float4(1.0f,1.0f,1.0f);
}

RasterizerState DisableCulling
{
	CullMode = NONE;
};

technique10 Render 
{
	pass P0
	{
		SetVertexShader(CompileShader(vs_4_0, VS()));
		SetGeometryShader(NULL);
		SetPixelShader(CompileShader(ps_4_0, PS()));
		SetRasterizerState(DisableCulling);
	}
}