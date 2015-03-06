#include "ManageDatabase.h"

//Connect to the Database
ManageDatabase::ManageDatabase()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("127.0.0.1");
    db.setDatabaseName("SixthSensor");
    db.setUserName("root");
    db.setPassword("");
    bool ok = db.open();

    if(!ok) {
        qDebug("Database did not open");
        return;
    }
    usersModel = new QSqlTableModel;
    imageStacksModel = new QSqlTableModel;
    imagesModel = new QSqlTableModel;
    flir_query = new QSqlQuery;

    usersModel->setTable("Users");
    imageStacksModel->setTable("ImageStacksMenu");
    imagesModel->setTable("Images");

    if(usersModel->rowCount() == 0) {
        flir_query->exec("INSERT INTO SixthSensor.Users (username, password)"
                   "VALUES ('SixthSensor', 'Capstone2015')");
    }

    flir_db = db;
}
//Func. to ensure User exists in the DB
bool ManageDatabase::checkUser(QString u, QString p){
    usersModel->select();
    for(int i = 0; i < usersModel->rowCount(); i++){
        QString un = usersModel->record(i).value("username").toString();
        QString psw = usersModel->record(i).value("password").toString();
        if(u == un && p == psw){
            currentUser = u;
            return true;
        }
    }
    return false;
}
//Add an Image Stack
void ManageDatabase::addImageStack_2db(QString name, QString comment, QString date){
    flir_query->prepare("INSERT INTO SixthSensor.ImageStacksMenu (username, comment, name, timestamp)"
               "VALUES (:uname, :cmt, :ISname, :datetime)");
    flir_query->bindValue(":uname", currentUser);
    flir_query->bindValue(":cmt", comment);
    flir_query->bindValue(":ISname", name);
    flir_query->bindValue(":datetime", date);
    flir_query->exec();
}
void ManageDatabase::moveImageStack(QString name, QString comment, QString date){
    imageStacksModel->select();
    for(int i = 0; i < imageStacksModel->rowCount(); i++){
        QString n = imageStacksModel->record(i).value("name").toString();
        QString c = imageStacksModel->record(i).value("comment").toString();
        QString t = imageStacksModel->record(i).value("timestamp").toString();
        if(n == name && c == comment && t == date){
            currentImageStackID = imageStacksModel->record(i).value("imageStack_id").toInt();
            return;
        }
    }
}
void ManageDatabase::getUserData(QString username){
    imageStacksModel->select();
    for(int i = 0; i < imageStacksModel->rowCount(); i++){
        QString u = imageStacksModel->record(i).value("username").toString();
        if(u == username){
            QString n = imageStacksModel->record(i).value("name").toString();
            QString c = imageStacksModel->record(i).value("comment").toString();
            QString t = imageStacksModel->record(i).value("timestamp").toString();
            emit updateData(n, t, c);
        }
    }
}
