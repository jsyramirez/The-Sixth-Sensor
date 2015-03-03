#ifndef BINTERFACE_H
#define BINTERFACE_H

#include <QObject>
#include <QDebug>
#include <stdio.h>
#include <stdlib.h>
#include "ManageDatabase.h"

class BInterface : public QObject
{
    Q_OBJECT
public:
    BInterface();
    void setupDatabse();
    Q_INVOKABLE bool checkLogin(QString u, QString p);
    Q_INVOKABLE void addImageStack(QString name, QString comment, QString date);
    Q_INVOKABLE void updateImageStack(QString name, QString comment, QString date);
    void makeConnections(QObject *item);

private:
    ManageDatabase *db;
};

#endif // BINTERFACE_H
