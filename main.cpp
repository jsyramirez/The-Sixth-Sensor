#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>

#include "BInterface.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    QObject *item = engine.rootObjects().value(0);
    BInterface *BI = new BInterface();
    engine.rootContext()->setContextProperty("BI", BI);
    BI->makeConnections(item);


    return app.exec();
}
