Shader "Custom/AT_Seis"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _AC ("Alinhamento em C", Range(0.1, 1)) = 0.1
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

        float _AC;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            float2 uv = IN.uv_MainTex;

            float f = _AC - length(float2(0.5, 0.5) - (uv));

            o.Albedo = f;
            o.Emission = f;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
