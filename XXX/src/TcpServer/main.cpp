#include <QCoreApplication>
#include <CTcpServer.h>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    CTcpServer tcpServer;
    return a.exec();
}

