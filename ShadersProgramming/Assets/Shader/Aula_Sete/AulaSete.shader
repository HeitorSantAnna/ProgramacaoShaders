Shader "Custom/AulaSete"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Slider ("Força", Range(0, 60)) = 0
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Ilumination alpha:blend

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        fixed4 _Color;
        float _Slider;

        void surf (Input IN, inout SurfaceOutput o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            o.Albedo = c * _Color;
            if(c.a >= 0.5)
            {
                o.Alpha = 1;
            } else
            {
                o.Alpha = 0;
            }
        }

        float4 LightingIlumination(SurfaceOutput s, float3 lightDir, float atten)
        {
            float d = round(dot(lightDir, s.Normal) * _Slider) / _Slider;
            return d * float4(s.Albedo, s.Alpha);
        }

        ENDCG
    }
    FallBack "Diffuse"
}
