#ifndef MANAGEDATABASE
#define MANAGEDATABASE

#include <stdio.h>
#include <stdlib.h>
#include <QtSql/QSql>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlDriver>
#include <QtSql/QSqlQuery>
#include <QDebug>
#include <QSqlQueryModel>
#include <QSqlRelationalTableModel>
#include <QSqlTableModel>
#include <QSqlRecord>
#include <QObject>

class ManageDatabase: public QObject
{
    Q_OBJECT
public:
    ManageDatabase();
    bool checkUser(QString u, QString p);
    void addImageStack_2db(QString name, QString comment, QString date);
    void moveImageStack(QString name, QString comment, QString date);

public slots:
    void getUserData(QString username);

signals:
    void updateData(QVariant n, QVariant d, QVariant c);

private:
    //Member Functions

    //Database Access Member Variables
    QSqlDatabase flir_db;
    QSqlQuery *flir_query;
    QSqlTableModel *usersModel;
    QSqlTableModel *imageStacksModel;
    QSqlTableModel *imagesModel;

    //User Member Variables
    QString currentUser;
    int currentImageStackID;
};

#endif // ManageDatabase

