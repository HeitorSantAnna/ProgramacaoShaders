Shader "Custom/Surface"
{
    Properties
    {
        _Color ("Color", Color) = (0,0,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _ColorH ("ColorH", Color) = (1, 0, 1)
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

        fixed4 _ColorH;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {

            //fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            o.Albedo = (_ColorH - _Color);
        }
        ENDCG
    }
    FallBack "Diffuse"
}