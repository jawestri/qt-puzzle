#include <QGuiApplication>
#include <QQuickView>
#include <QQuickItem>

#include "puzzle.h"

/*

  main.cpp
  Main CPP File defines connection between Qt and QML files for Sliding Puzzle Game
  By: Jamie Westick
  Created: 9/12/2018

*/

int main(int argc, char **argv)
{
    QGuiApplication app(argc, argv);
    QQuickView view;
    view.setSource(QUrl("qrc:///main.qml"));

    mypuzzle *pPuzzleSignal = new mypuzzle();

    QQuickItem *pQMLRectangle = view.rootObject();

    QObject::connect(
                pPuzzleSignal,
                SIGNAL(updateTimer(QVariant)),
                pQMLRectangle,
                SLOT(onUpdateTimer(QVariant))
                );

    QObject::connect(
                pPuzzleSignal,
                SIGNAL(randSignal(QVariant)),
                pQMLRectangle,
                SLOT(onRandSignal(QVariant))
                );
    QObject::connect(
                pQMLRectangle,
                SIGNAL(startNew()),
                pPuzzleSignal,
                SLOT(onStartNew())
                );
    QObject::connect(
                pQMLRectangle,
                SIGNAL(getRand()),
                pPuzzleSignal,
                SLOT(onGetRand())
                );
    QObject::connect(
                pQMLRectangle,
                SIGNAL(stopTimer()),
                pPuzzleSignal,
                SLOT(onStopTimer())
                );


    view.show();
    return app.exec();
}
