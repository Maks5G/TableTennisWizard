#include "fileio.h"
#include "mylang.h"
#include "mytranslator.h"
#include <QGuiApplication>
#include <QIcon>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTextCodec>

int main(int argc, char *argv[]) {
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
  // ЩОБ ДЕРЖАВНОЮ ЗЧИТУВАВ ФАЙЛИ
  QTextCodec *codec = QTextCodec::codecForName("UTF-8");
  QTextCodec::setCodecForLocale(codec);
  // А ТО САМ НЕ ХОЧЕ

  QGuiApplication app(argc, argv);
  app.setWindowIcon(QIcon(":/ui/assets/TableTennisWizard Icon.png"));
  qmlRegisterType<MyLang>("MyLang", 1, 0, "MyLang");

  MyTranslator mTrans(&app);
  QQmlApplicationEngine engine;
  QQmlContext *context = engine.rootContext();

  const QUrl url(QStringLiteral("qrc:/main.qml"));
  qmlRegisterType<FileIO, 1>("NeloAngelo", 1, 0, "FileIO");
  QObject::connect(
      &engine, &QQmlApplicationEngine::objectCreated, &app,
      [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
          QCoreApplication::exit(-1);
      },
      Qt::QueuedConnection);
  context->setContextProperty("mytrans", (QObject *)&mTrans);

  engine.load(url);

  return app.exec();
}
