#ifndef PUZZLE_H
#define PUZZLE_H
#include <QTimer>
#include <QObject>
#include <QDebug>
#include <QVariant>
#include <QObject>
#include <QDebug>

/*

  puzzle.h
  Header file defining puzzle class for Sliding Puzzle Game
  By: Jamie Westick
  Created: 9/12/2018

*/

class mypuzzle: public QObject
{
    Q_OBJECT
private:
    QTimer *pTimer;
    int notUsed[8];
    int timer;

public:
    void start();
    mypuzzle();
signals:
    void updateTimer(QVariant);
    void randSignal(QVariant);
    
private slots:
    void onStartNew();
    void onTimerEvent();
    void onGetRand();
    void onStopTimer();


};
#endif // PUZZLE_H
