Shader "Custom/AT_Quatro"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _AA ("Alinhamento em A", Range(-10, 100)) = 0
        _AB ("Alinhamento em B", Range(-100, 10)) = 0
        _AC ("Alinhamento em C", Range(-10, 10)) = 0
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

        fixed4 _Color;

        float _AA, _AB, _AC;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            float2 uv = IN.uv_MainTex;

            float f = sin((uv.x * _AA) + (uv.y * _AB) + _AC);

            o.Albedo = f;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
