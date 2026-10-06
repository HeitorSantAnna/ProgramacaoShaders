Shader "Custom/AT_Um"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Red ("Vermelho", Range(0, 1)) = 0
        _Green ("Verde", Range(0, 1)) = 0
        _Blue ("Azul", Range(0, 1)) = 0
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
        float _Red, _Green, _Blue;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            float3 t = float3(_Red, _Green, _Blue);
          
            //o.Albedo = t;
            o.Emission = t;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
