Shader "Custom/XadrezTexture"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _SecColor("Segunda Cor", Color) = (0, 0, 0, 1)
        _RX ("ALinhamento", Range(0, 3)) = 1
        _RC ("Centro do Circulo", Range(-1, 1)) = 0
        _RB ("Alinhamento B", Range(-1, 1)) = 0
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
        float _RX, _RC, _RB;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);

            float2 uv = IN.uv_MainTex;

            float3 d[] = {float3(1, 1, 1), float3(1, 1, 1)};

            int j = (uv.x * 6 % 6);
            int k = (uv.y * 6 % 6);

            int res = j + k;

            float i = sin(_Time.y * 3) + _RB;

            float q = cos(_Time.y * 3) + _RB;

            float f = 1-length(float2(i, q) - (uv/(_Time.y * 30)));

            float3 finalColor = float3(i, q, 1);

            if(res % 2 == 0)
            {
                o.Albedo = f * finalColor;
            }
            else
            {
                o.Albedo = (1 - f) * (1-finalColor);
            }
        }
        ENDCG
    }
    FallBack "Diffuse"
}
