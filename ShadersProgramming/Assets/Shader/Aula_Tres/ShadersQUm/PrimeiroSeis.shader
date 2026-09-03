Shader "Custom/PrimeiroSeis"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _RX ("Alinhamento em X", Range(0, 1)) = 1
        _RY ("Alinhamento em Y", Range(-1, 1)) = 0
        _RB ("Alinhamento extra", Range(-10, 10)) = 0
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows alpha:blend

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        fixed4 _Color;

        float _RX;

        float _RY;

        float _RB;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {

            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;

            float2 uv = IN.uv_MainTex;

            float rx = _RX;
            float ry = _RY;
            float rb = _RB;

            float r = 1 - length(float2(1, 1) - (uv/0.5));

            //o.Normal = sin(r);
            //o.Albedo = 1 - length((float2(0.5, 0.5) - (uv)) / 1);
            o.Albedo = o.Normal;
            o.Alpha = _RX;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
