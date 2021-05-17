// Digite aqui seu código GLSL para gerar uma imagem
// O GLSL é muito próximo do C, mas não é idêntico.

// Essa linha vai definir a precisão do float,
// e mediump é bom o bastante no momento.
precision mediump float;

// Aqui não tem conversão automática entre int e float
// Então coloque .0 quando precisar de floats

// As janelas tem um tamanho fixo de 3000x3000
#define WIDTH (3000.0)
#define HEIGHT (3000.0)

// Constantes do limite do plano cartesiano
#define Xi (-2.0)
#define Xj (+1.0)
#define Yi (-1.5)
#define Yj (+1.5)

#define Xd (Xj - Xi)
#define Yd (Yj - Yi)


// diferente do código em JS
// a GPU roda essa função main para cada pixel
void main() {
    // Aqui o pixel é guardado num vetor de 4 floats
    // Também segue o formato RGBA, mas dessa vez
    // os campos variam de 0.0 a 1.0

    // vamos obter as coordenadas do plano a partir da
    // variável gl_FragCoord que é pré definida para cada pixel
    vec2 xy = (gl_FragCoord.xy / vec2(WIDTH, HEIGHT) * vec2(Xd, Yd)) + vec2(Xi, Yi);

    // Para acessa o x ou o y individualmente é só usar
    // xy.x e xy.y respectivamente
    float x = xy.x;
    float y = xy.y;

    //compute a cor do pixel aqui
    float zx = 0.0;
    float zy = 0.0;
    int steps = 255; 

    for(int i = 0; i < 255; i++) {
         float new_zx = zx*zx - zy*zy + x;
         float new_zy = 2.0*zx*zy + y;
         
         zx = new_zx;
         zy = new_zy;

         if(zx*zx + zy*zy > 4.0) {
            steps = i;
            break;
         }
    }

    float step_A, step_B;
    float red_A, red_B;
    float green_A, green_B;
    float blue_A, blue_B;

    if(steps < 10) {
        step_A = 0.0;
        step_B = 10.0;
        red_A = 0.0;
        red_B = 32.0;
        green_A = 7.0;
        green_B = 107.0;
        blue_A = 100.0;
        blue_B = 203.0;
    } else if(steps >= 10 && steps < 80) {
        step_A = 10.0;
        step_B = 80.0;
        red_A = 32.0;
        red_B = 237.0;
        green_A = 107.0;
        green_B = 255.0;
        blue_A = 203.0;
        blue_B = 255.0;
    } else if(steps >= 80 && steps < 150) {
        step_A = 80.0;
        step_B = 150.0;
        red_A = 237.0;
        red_B = 255.0;
        green_A = 255.0;
        green_B = 170.0;
        blue_A = 255.0;
        blue_B = 0.0;
    } else if(steps >= 150 && steps < 200) {
        step_A = 150.0;
        step_B = 200.0;
        red_A = 255.0;
        red_B = 100.0;
        green_A = 170.0;
        green_B = 120.0;
        blue_A = 0.0;
        blue_B = 0.0;
    } else {
        step_A = 200.0;
        step_B = 255.0;
        red_A = 100.0;
        red_B = 0.0;
        green_A = 120.0;
        green_B = 0.0;
        blue_A = 0.0;
        blue_B = 0.0;
    }

    float pct = ((float(steps) - step_A) / (step_B - step_A));
    
    float red = sqrt(red_A * red_A * (1.0 - pct) + red_B * red_B * pct) / 255.0;
    float green = sqrt(green_A * green_A * (1.0 - pct) + green_B * green_B * pct) / 255.0;
    float blue = sqrt(blue_A * blue_A * (1.0 - pct) + blue_B * blue_B * pct) / 255.0;

    //*****************************
    // Aplica a cor
    gl_FragColor = vec4(red, green, blue, 1.0);
}

// Clique em Run GLSL para rodar o código ;)