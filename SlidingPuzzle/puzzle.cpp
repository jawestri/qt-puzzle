#include "puzzle.h"
/*

  puzzle.cpp
  Defines puzzle functions Sliding Puzzle Game
  By: Jamie Westick
  Created: 9/12/2018

*/


//Initialize timer and array of rounds not used yet
mypuzzle::mypuzzle(){
    for (int i = 0; i < 8; i++){
        notUsed[i]= i + 1;
    }

    timer = 0;

}

//start new round will reset timer
void mypuzzle::onStartNew(){

    timer = 0;
    start();
}


//start game timer
void mypuzzle::start(){
    pTimer = new QTimer();

    connect(
                pTimer,
                SIGNAL(timeout()),
                this,
                SLOT(onTimerEvent())
                );

    pTimer->start(1000);


}

//send signal to qml each second to update game timer
void mypuzzle::onTimerEvent(){
    timer++;
    emit updateTimer(timer);
    pTimer->start(1000);

}

//on signal for qml --> select random puzzle configuration from 8 choices
void mypuzzle::onGetRand(){
    bool check = false;
    while(!check){
        int irand = (rand()% 8)+1;
        for(int i=0;i<8;i++){
            if(notUsed[i]==irand){
                notUsed[i] = -1;
                check =true;
                emit randSignal(irand);
            }

        }
    }
}

//at end of round stop the timer
void mypuzzle::onStopTimer(){
    pTimer->stop();
}
