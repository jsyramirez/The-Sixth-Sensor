#include "BInterface.h"

BInterface::BInterface()
{
    db = new ManageDatabase();

}
void BInterface::makeConnections(QObject *item){

    QObject::connect(item, SIGNAL(userLoggedIn(QString)),
                     db, SLOT(getUserData(QString)));
    QObject::connect(db, SIGNAL(updateData(QVariant, QVariant, QVariant)),
                     item, SLOT(insertData(QVariant, QVariant, QVariant)));
}

bool BInterface::checkLogin(QString u, QString p){
    bool r = db->checkUser(u, p);
    return r;
}
void BInterface::addImageStack(QString name, QString comment, QString date){
    db->addImageStack_2db(name, comment, date);
}
void BInterface::updateImageStack(QString name, QString comment, QString date){
    db->moveImageStack(name, comment, date);
}

