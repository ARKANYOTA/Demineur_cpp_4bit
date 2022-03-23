#include <iostream>
#include <algorithm>
#include <json/json.h>
#include <fstream>
#include <thread>
#include <chrono>
#include <string>
#include <signal.h>
#include <cstdlib>
#include <bitset>

#define BOMBS "\033[31m\u2622\033[0m"
#define FLAGS "\033[32m\u2691\033[0m"
#define EMPTY "\033[34m\u25A1\033[0m"
#define VISITED " "

using namespace std;


namespace Fx {
    const string e = "\x1b[";                //* Escape sequence start
    const string b = e + "1m";                //* Bold on/off
    const string ub = e + "22m";            //* Bold off
    const string d = e + "2m";                //* Dark on
    const string ud = e + "22m";            //* Dark off
    const string i = e + "3m";                //* Italic on
    const string ui = e + "23m";            //* Italic off
    const string ul = e + "4m";                //* Underline on
    const string uul = e + "24m";            //* Underline off
    const string bl = e + "5m";                //* Blink on
    const string ubl = e + "25m";            //* Blink off
    const string s = e + "9m";                //* Strike/crossed-out on
    const string us = e + "29m";            //* Strike/crossed-out on/off
    const string reset_base = e + "0m";
}
namespace Term {
    const string hide_cursor = Fx::e + "?25l";
    const string show_cursor = Fx::e + "?25h";
    const string alt_screen = Fx::e + "?1049h";
    const string normal_screen = Fx::e + "?1049l";
    const string clear = Fx::e + "2J" + Fx::e + "0;0f";
    const string clear_end = Fx::e + "0J";
    const string clear_begin = Fx::e + "1J";
    const string mouse_on = Fx::e + "?1002h" + Fx::e + "?1015h" + Fx::e +
                            "?1006h"; //? Enable reporting of mouse position on click and release
    const string mouse_off = Fx::e + "?1002l" + Fx::e + "?1015l" + Fx::e + "?1006l";
    const string mouse_direct_on = Fx::e + "?1003h"; //? Enable reporting of mouse position at any movement
    const string mouse_direct_off = Fx::e + "?1003l";
    const string sync_start = Fx::e + "?2026h"; //? Start of terminal synchronized output
    const string sync_end = Fx::e + "?2026l"; //? End of terminal synchronized output
}
namespace Globals {
    char keys[1024];
    int a = 255;
    int i = 0;
}

void clean_exit() {
    cout << Term::mouse_off << endl; //<< Term::mouse_direct_off << endl;
    exit(0);
}
void signal_handler(int signal) {
    clean_exit();
}



/*
int update() {
    while (Globals::a--) {
        Globals::keys[Globals::i] = (char) getchar();
        Globals::i++;
    }
    return 0;
}

int draw() {
    while(Globals::a > 0) {
        if (Globals::keys[0] == 'q') {
            clean_exit();
        }
        cout << Globals::a <<"|" << Globals::keys << "|" << endl;
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }
    return 0;
}
*/
/* FOR 2 BIT THING
int pos(int x, int y, int gridsize){
    return y*5+x/4;
}

int bitshift(int x){
    return (3-(x%4))*2;
}

char modif_char(int x, char c, int b2_modif) {
    c &= ~(3 << bitshift(x));
    c |= b2_modif << bitshift(x);
    return c;
}


int main() {
    int gridsize = 20*20;
    unsigned char s[gridsize] = {0};
    for (int i = 0; i < 20; i++) {
        for (int j = 0; j < 20; j++) {
            // s[j*20+i] = i+j;
            s[pos(j,i,gridsize)] = modif_char(j,s[pos(j,i,gridsize)], j%5);
        }
    }
    // Draw Grid
    for (int i = 0; i < 20; i++) {
        for (int j = 0; j < 20; j++) {
            // cout << int(s[j*20+i]) << " ";
            cout << std::bitset<2>((s[pos(j,i,gridsize)] >> bitshift(j)) &3 ) << " "; // << bitshift(x)) & 3) << " ";
        }
        cout << endl;
    }
    

    // End Draw Grid

    // signal(SIGINT, signal_handler);
    // cout << Term::mouse_on << Term::mouse_direct_on << endl;
    // initTermios(0);

    // thread t1(update);
    // thread t2(draw);

    // t1.join();
    // t2.join();

    // resetTermios();
    
    // unsigned char a = 0b00000000;

    // char b = modif_char(0, a, 2);

    // cout << std::bitset<8>(a) << "|" << std::bitset<8>(b) << endl;


    return 0;
}



    // End Draw Grid

    // signal(SIGINT, signal_handler);
    // cout << Term::mouse_on << Term::mouse_direct_on << endl;
    // initTermios(0);

    // thread t1(update);
    // thread t2(draw);

    // t1.join();
    // t2.join();

    // resetTermios();

    // unsigned char a = 0b00000000;

    // char b = modif_char(0, a, 2);

    // cout << std::bitset<8>(a) << "|" << std::bitset<8>(b) << endl;



*/


int pos(int x, int y, int gridsize) {
    return y * 10 + x / 2;
}
int bitshift(int x) {
    return (1 - (x % 2)) * 4;
}
char modif_char(int x, char c, int b4_modif) {
    c &= ~(15 << bitshift(x));
    c |= b4_modif << bitshift(x);
    return c;
}

// Representation d'une case dans un octet
// +---------+
// | 0 0 0 0 |
// +---------+
//   | | | |
//   | | | ^- Is Discovered
//   | | | 
//   | | ^--- Is Bomb
//   | |
//   | ^---- Is Flag
//   |
//   ^------ Sert a rien (Mais peut tjr etre utiliser pour qqchose)

int min(int a, int b) {
    return (a < b) ? a : b;
}
int max(int a, int b) {
    return (a > b) ? a : b;
}
bool get_bit(int x, int y, int gridsize, int bit, unsigned char *s) {
    int bits4 = s[pos(x, y, gridsize)] >> bitshift(x) & 0b1111;
    return (bits4 >> bit) & 1;
}
void set_bit(int x, int y, int gridsize, int bit, unsigned char *s, bool new_bit) {
    char c = s[pos(x, y, gridsize)];
    int realbin = (bit + bitshift(x));
    c &= ~(1 << realbin);
    c |= (new_bit << realbin);
    s[pos(x, y, gridsize)] = c;
}
void generate_bombs(unsigned char *s, int nb_bombes, int gridsize, int clic_x, int clic_y) {
    nb_bombes = min(nb_bombes, gridsize * gridsize / 2); //(nb_bombes < gridsize*gridsize/2)? nb_bombes : gridsize*gridsize/2 // Min pour éviter que il y ai trop de bombes
    nb_bombes = max(nb_bombes, 1);                  // Max pour supérieur a 1

    int x, y;
    while(nb_bombes > 0){
        x = rand() % 20;
        y = rand() % 20;
        if(!get_bit(x, y, gridsize, 1, s) && clic_x != x && clic_y != y){
            set_bit(x, y, gridsize, 1, s, true);
            nb_bombes--;
        }
    }
    return;
}

void discover_case(unsigned char *s, int gridsize, int x, int y) {
    if(get_bit(x, y, gridsize, 0, s)){
        return;
    }
    set_bit(x, y, gridsize, 0, s, true);
    if(get_bit(x, y, gridsize, 1, s)){
        return;
    }
    int nb_bombes = 0;
    for(int i = -1; i <= 1; i++){
        for(int j = -1; j <= 1; j++){
            if(get_bit(x+i, y+j, gridsize, 1, s)){
                nb_bombes++;
            }
        }
    }
    if(nb_bombes == 0){
        for (int i = -1; i <= 1; i++) {
            for (int j = -1; j <= 1; j++) {
                if (!get_bit(x + i, y + j, gridsize, 0, s)) {
                    cout << "i: " << x+i << " j: " << x+j << endl;
                    if(x+i >= 1 && x+i < gridsize && y+j >= 0 && y+j < gridsize){
                        discover_case(s, gridsize, x+i, y+j);
                    }
                }
            }
        }
    }

    return;
}

int main() {
    srand (time(NULL));
    int gridsize = 20 * 20;
    unsigned char s[gridsize] = {0};
    for (int i = 0; i < 20; i++) {
        for (int j = 0; j < 20; j++) {
            // s[j*20+i] = i+j;
            s[pos(j, i, gridsize)] = modif_char(j, s[pos(j, i, gridsize)], 0);
        }
    }
    // Draw Grid
    // s[pos(j,i,gridsize)] = modif_char(j,s[pos(j,i,gridsize)], 9);
    int x, y;
    cin >> x >> y;
    generate_bombs(s, 100, gridsize, x, y);
    discover_case(s, gridsize, x, y);
    while (true) {
        for (int i = 0; i < 20; i++) {
            for (int j = 0; j < 20; j++) {
                // cout << int(s[j*20+i]) << " ";

                if (get_bit(j, i, gridsize, 0, s)) {
                    int nb_bombes = 0;
                    for (int k = -1; k <= 1; k++) {
                        for (int l = -1; l <= 1; l++) {
                            if (i + k >= 0 && i + k < 20 && j + l >= 0 && j + l < 20) {
                                if (get_bit(j + l, i + k, gridsize, 1, s)) {
                                    nb_bombes++;
                                }
                            }
                        }
                    }
                    cout << nb_bombes << " ";
                } else if (get_bit(j, i, gridsize, 1, s)) {
                    cout << BOMBS << " ";
                }else {
                    cout << EMPTY << " ";
                }
                //cout << "" << get_bit(j, i, gridsize, 1, s) << " ";
                // cout << std::bitset<4>((s[pos(j, i, gridsize)] >> bitshift(j))) << " "; // >> bitshift(j) // << bitshift(x)) & 3) << " ";
            }
            cout << endl;
        }
        cin >> x >> y;
        cout << "Vous avez clique sur la case (" << x << ", " << y << ")" << endl;
        discover_case(s, gridsize, x, y);
    }


    return 0;
}
