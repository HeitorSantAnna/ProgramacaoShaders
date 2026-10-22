Shader "Custom/AT_Oito"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _SecColor ("Segunda Cor", Color) = (1, 1, 1, 1)

        _AA ("Alinhamento em A", Range(0, 1)) = 0
        _AB ("Alinhamento em B", Range(0, 1)) = 0
        _AC ("Alinhamento em C", Range(0, 1)) = 0
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        fixed4 _Color, _SecColor;

        float _AA, _AB, _AC;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            float2 uv = IN.uv_MainTex;

            float f = round((uv.x * _AA) + (uv.y * _AB) + _AC);

            if(uv.x >= 0.5 && uv.y >= 0.5 || uv.x < 0.5 && uv.y < 0.5)
            {
                o.Albedo = _Color;
            } 
            else if(uv.x < 0.5 && uv.y >= 0.5 || uv.x >= 0.5 && uv.y < 0.5)
            {
                o.Albedo = _SecColor;
            }
        }
        ENDCG
    }
    FallBack "Diffuse"
}
