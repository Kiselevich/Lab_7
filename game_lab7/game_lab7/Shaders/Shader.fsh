//
//  Shader.fsh
//  game_lab7
//
//  Created by Admin on 19.05.17.
//  Copyright © 2017 Oleg Kiselevich. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
