/*
8puzzle.cpp : 8パズルの最短手を求めるプログラム
author      : Koyo Miyamura
*/

#include <stdio.h>
#include <iostream>
#include <queue>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <utility>

#define N_C 362880 //9! = 362880

class Puzzle{
private:
    int p[3][3];
    int step_opt;
    int check_board[N_C];

    typedef struct{
        int p_b[3][3];
        int exclude;
        int from;
        int choice;
    } Board;

    // This changes board state into number
    int board_number(Board board){
        int num = 0;
        int i,j =0;
        int tmp[9];
        const int Factorial[9] = {40320, 5040, 720, 120, 24, 6, 2, 1, 0};

        for(i = 0; i <= 2; i++){
            for(j = 0; j <= 2; j++){
                tmp[(3 * i) + j] = board.p_b[i][j];
            }
        }

        for(i = 0; i < 8 ; i++){
            num += tmp[i] * Factorial[i];
            for(j = i + 1; j <= 8; j++){
                if(tmp[i] < tmp[j]) tmp[j]--;
            }
        }

    return num;
    }

    // Used for optend()
    int endcheck_for_opt(int p2[3][3]){
        int i,j;
        int p_e[3][3];
        int flag = 1;

        p_e[0][0] = 0; p_e[0][1] = 1; p_e[0][2] = 2;
        p_e[1][0] = 3; p_e[1][1] = 4; p_e[1][2] = 6;
        p_e[2][0] = 7; p_e[2][1] = 8; p_e[2][2] = 0;

        for(i = 0; i <= 2 ; i++){
            for(j = 0; j <= 2 ; j++){
                if(p2[i][j] != i * 3 + j) flag = 0;
            }
        }

        return flag;
    }

    // Used for optend()
    std::queue<std::pair<int, int>> next_q(int p2[3][3], int exclude){
        std::queue<std::pair<int, int>> q;
        int i, j;
        int null_i, null_j;

        for(i = 0; i <= 2 ; i++){
            for(j = 0; j <= 2 ; j++){
                if(p2[i][j] == 0){
                    null_i = i;
                    null_j = j;
                }
            }
        }
        for(i = 0; i <= 2 ; i++){
            for(j = 0; j <= 2 ; j++){
                if(p2[i][j] != exclude){
                    if (i + 1 == null_i && j == null_j) {
                        q.push({p2[i][j], 0});
                    } else if (i - 1 == null_i && j == null_j) {
                        q.push({p2[i][j], 2});
                    } else if (i == null_i && j - 1 == null_j) {
                        q.push({p2[i][j], 1});
                    } else if (i == null_i && j + 1 == null_j) {
                        q.push({p2[i][j], 3});
                    }
                }
            }
        }
        return q;
    }

    // Used for optend()
    void swap_for_opt(int num, int p2[3][3]){
        int i, j;
        int n_i, n_j, null_i, null_j;

        for(i = 0; i <= 2 ; i++){
            for(j = 0; j <= 2 ; j++){
                if(p2[i][j] == num){
                    n_i = i;
                    n_j = j;
                }
                else if(p2[i][j] == 0){
                    null_i = i;
                    null_j = j;
                }
            }
        }

        p2[null_i][null_j] = num;
        p2[n_i][n_j] = 0;
        return;
    }

    // Return opt step number for input board
    int optend(int step, Board *board, int n_board){
        std::queue<std::pair<int, int>> q;
        int i, j, k, num;
        int board_num;
        int from;
        int q_num = 0;
        Board *board_new;
        board_new = (Board *)malloc(sizeof(Board) * 3);
        // std::cout << step << "手目" << std::endl;
        // std::cout << "探索数：" << n_board << std::endl;

        if(step == 1){
            if(endcheck_for_opt(board[0].p_b) == 1){
                return 0;
            }
        }

        for(i = 0; i < n_board; i++){
            board_num = board_number(board[i]);
            if(check_board[board_num] == 0){
                check_board[board_num] = 1;
                q = next_q(board[i].p_b, board[i].exclude);
                board_new = (Board *)realloc(board_new, sizeof(Board) * (q.size() + q_num));

                while(q.empty() != 1){
                    for(j = 0; j <= 2; j++){
                        for(k = 0; k <= 2; k++){
                            board_new[q_num].p_b[j][k] = board[i].p_b[j][k];
                        }
                    }
                    const std::pair<int, int> p = q.front();
                    num = p.first;
                    board_new[q_num].exclude = num;
                    q.pop();
                    swap_for_opt(num, board_new[q_num].p_b);
                    board_new[q_num].from = i;
                    board_new[q_num].choice = p.second;
                    if(endcheck_for_opt(board_new[q_num].p_b) == 1){
                        free(board_new);
                        std::cout << p.second << ' ';
                        return i;
                    }
                    q_num ++;
                }
            }
        }

        //recursive call
        from = optend(step + 1, board_new, q_num);
        std::cout << board_new[from].choice << ' ';
        from = board_new[from].from;
        free(board_new);
        return from;
    }

public:
//Constructor
    Puzzle(char **state){
    int i;

    for(i = 0; i < N_C ; i++) check_board[i] = 0;

        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                p[i][j] = atoi(state[i * 3 + j]);
            }
        }

//------------ここに最短手を求めたい8パズルの初期状態を入力-------------
    // 最短25手
        // p[0][0] = 8; p[0][1] = 1; p[0][2] = 7;
        // p[1][0] = 6; p[1][1] = 3; p[1][2] = 4;
        // p[2][0] = 2; p[2][1] = 0; p[2][2] = 5;

    /*
    // 最短31手
        p[0][0] = 8; p[0][1] = 6; p[0][2] = 7;
        p[1][0] = 2; p[1][1] = 5; p[1][2] = 4;
        p[2][0] = 3; p[2][1] = 0; p[2][2] = 1;

    /*
    // 最短18回
        p[0][0] = 1; p[0][1] = 4; p[0][2] = 3;
        p[1][0] = 7; p[1][1] = 2; p[1][2] = 6;
        p[2][0] = 8; p[2][1] = 5; p[2][2] = 0;
    */

    /*
    // 最短1回
        p[0][0] = 1; p[0][1] = 2; p[0][2] = 3;
        p[1][0] = 4; p[1][1] = 5; p[1][2] = 6;
        p[2][0] = 7; p[2][1] = 0; p[2][2] = 8;
    */
    }
//------------------------------------------------------------

    void print(){
        int i, j;
        printf("------------------\n");
        for(i = 0; i <= 2 ; i++){
            for(j = 0; j <= 2 ; j++){
                if(p[i][j] != 0){
                    printf("%d \t", p[i][j]);
                }
                else{
                    printf("  \t");
                }
            }

            printf("\n");
        }

        printf("------------------\n");
        return;
    }

//-----getter,setter-----
    int Getoptstep(){
        int i, j;
        Board p_board[1];
        for(i = 0; i <= 2 ; i++){
            for(j = 0; j <= 2 ; j++){
                p_board[0].p_b[i][j] = p[i][j];
            }
        }
        p_board[0].exclude = 10;//0~8以外の整数であればいい
        step_opt = optend(1, p_board, 1);
        return step_opt;
    }
};

int main(int argc, char **argv){
Puzzle pz(argv + 1);

// std::cout << "初期状態" << std::endl;
// pz.print();

// std::cout << "最短の手数は" << pz.Getoptstep() << "回" << std::endl;
pz.Getoptstep();
std::cout << std::endl;
return 0;
}
