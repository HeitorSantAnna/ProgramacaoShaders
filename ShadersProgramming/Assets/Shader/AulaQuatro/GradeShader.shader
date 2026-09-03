Shader "Custom/GradeShader"
{
    Properties
    {
        [HDR] _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _RX ("Alinhamento em X", Range(-1000, 1000)) = 0
        _RY ("Alinhamento em Y", Range(-10, 10)) = 0
        _RB ("Alinhamento em B", Range(-10, 10)) = 0
        _AC ("Alpha Controller", Range(0, 1)) = 1
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

        float _RX, _RY, _RB, _AC;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);

            float2 uv = IN.uv_MainTex;

            float grade = saturate(sin(((uv.x * _RX) + (uv.y * _RY) + _RB)));

            o.Albedo = grade * _Color;
            o.Alpha = grade;
            o.Emission = _Color;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
