#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
    viewer.setFlags (Qt::Window|Qt::WindowFullscreenButtonHint);
    viewer.setMainQmlFile(QStringLiteral("qml/StatisticsBoard/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
