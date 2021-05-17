// Digite aqui seu código JS para gerar uma imagem

// As janelas tem um tamanho fixo de 3000x3000
const WIDTH = 3000;
const HEIGHT = 3000;

// Constantes do limite o plano cartesiano
const Xi = -2.0;
const Xj = +1.0;
const Yi = -1.5;
const Yj = +1.5;

const Xd = Xj - Xi;
const Yd = Yj - Yi;

const main = (data) => {
    //Data é um array de bytes que representa a imagem
    //O valor mínimo é 0 e o máximo é 255
    //A cada 4 bytes temos um pixel
    //Red Green Blue Alpha

    //Vamos usar o for para percorrer cada pixel
    for(let i = 0; i < data.length; i += 4) {
        const _x = Math.floor((i/4) % 3000);
        const _y = Math.floor((i/4) / 3000);

        //converte para um plano cartesiano indo de Xi-Xj e Yi-Yj.
        const x = Xi + (_x/WIDTH) * Xd;
        const y = Yj - (_y/HEIGHT) * Yd;

        let zx = 0;
        let zy = 0;
        let steps = 0;

        while(steps < 255) {
            let new_zx = zx * zx - zy * zy + x;
            let new_zy = 2 * zx * zy + y;

            zx = new_zx;
            zy = new_zy;

            if((zx * zx + zy * zy) > 4) {
                break;
            }

            steps++;            
        }        

        let step_A;
        let step_B;
        let red_A;
        let red_B;
        let green_A;
        let green_B;
        let blue_A;
        let blue_B;

        if(steps < 10) {
            step_A = red_A = 0;
            step_B = 10;
            red_B = 32;
            green_A = 7;
            green_B = 107;
            blue_A = 100;
            blue_B = 203;
        } else if(steps >= 10 && steps < 80) {
            step_A = 10;
            step_B = 80;
            red_A = 32;
            red_B = 237;
            green_A = 107;
            green_B = blue_B = 255;
            blue_A = 203;
        } else if(steps >= 80 && steps < 150) {
            step_A = 80;
            step_B = 150;
            red_A = 237;
            red_B = green_A = blue_A = 255;
            green_B = 170;
            blue_B = 0;
        } else if(steps >= 150 && steps < 200) {
            step_A = 150;
            step_B = 200;
            red_A = 255;
            red_B = 100;
            green_A = 170;
            green_B = 120;
            blue_A = blue_B = 0;
        } else {
            step_A = 200;
            step_B = 255;
            red_A = 100;
            red_B = green_B = blue_A = blue_B = 0;
            green_A = 120;
        }

        let pct = (steps - step_A) / (step_B - step_A);

        const red = Math.sqrt(red_A * red_A * (1 - pct) + red_B * red_B * pct);
        const green = Math.sqrt(green_A * green_A * (1 - pct) + green_B * green_B * pct);
        const blue = Math.sqrt(blue_A * blue_A * (1 - pct) + blue_B * blue_B * pct);

        //define a cor do pixel
        data[i]   = red;
        data[i+1] = green;
        data[i+2] = blue;
        data[i+3] = 255;
    }
};

// O nome da função a ser executada retornada deve aparecer no final
// clique em Run JS e aguarde um pouco para o seu código executar
main