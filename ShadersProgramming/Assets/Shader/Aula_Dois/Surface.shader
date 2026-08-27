Shader "Custom/Surface"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _ColorW ("Color in White", Color) = (1, 0, 1)
        _ColorB ("Color in Black", Color) = (0, 1, 1)
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

        fixed4 _ColorB;

        fixed4 _ColorW;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            if(IN.uv_MainTex.x > 0.5)
            {
                float4 colorB= float4(_ColorB);
                o.Albedo = colorB;
            } else{
                float4 colorw = float4(_ColorW);
                o.Albedo = colorw;
            }

            if(IN.uv_MainTex.y > 0.5)
            {
                float4 colorw = float4(_ColorW);
                o.Albedo -= colorw;
            } 
            else
            {
                float4 colorB= float4(_ColorB);
                o.Albedo -= colorB;
            }
        }
        ENDCG
    }
    FallBack "Diffuse"
}