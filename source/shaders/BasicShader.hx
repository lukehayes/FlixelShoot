package shaders;

import flixel.system.FlxAssets.FlxShader;
import openfl.filters.ShaderFilter;
import openfl.display.Shader;

/**
 * Chromatic Abberation Shader
 * Fetched from "https://github.com/bbpanzu/FNF-Sunday/blob/main/source_sunday/ChromaticAberration.hx"
 **/
class BasicShader extends FlxShader
{
    @:glFragmentSource('
#pragma header

            uniform float c;

            void main()
            {
                vec4 col1 = texture2D(bitmap, openfl_TextureCoordv.st - vec2(rOffset, 0.0));
                vec4 toUse = texture2D(bitmap, openfl_TextureCoordv);
                toUse.r = col1.r;

                gl_FragColor = toUse;
            }')

    public function new()
    {
        super();
    }

    public function setChrome(chromeOffset:Float):Void
    {
        //rOffset.value = [chromeOffset];
        //gOffset.value = [0.0];
        //bOffset.value = [chromeOffset * -1];
    }
}
