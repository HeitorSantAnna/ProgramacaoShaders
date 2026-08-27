Shader "Custom/PrimeiroOnze"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _SecColor ("Segunda Cor", Color) = (0, 0, 0, 1)
        _RX ("Alinhamento em X", Range(-10, 20)) = 0
        _RY ("Alinhamento em Y", Range(-10, 20)) = 0
        _RB ("Alinhamento extra", Range(-10, 10)) = 0
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

        fixed4 _SecColor;

        float _RX;
        float _RY;
        float _RB;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);

            float2 uv = IN.uv_MainTex;

            float rx = _RX;
            float ry = _RY;
            float rb = _RB;

            float j = sin(((uv.x * rx) + rb) + ((uv.y * ry) + rb));

            if(j > 0.2)
            {
                o.Albedo = _Color;
            }
            else
            {
                o.Albedo = _SecColor;
            }
        }
        ENDCG
    }
    FallBack "Diffuse"
}
