/*
#include "setupdatabase.h"


SetupDatabase::SetupDatabase()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("sixth_sensor");
    db.setDatabaseName("flir_db");
    db.setUserName("the_sixth_sensor");
    db.setPassword("Capstone2015");
    bool ok = db.open();

    if(!ok) {
        return QSqlDatabase::lastError();
    }

    flir_db = db;

}
*/
