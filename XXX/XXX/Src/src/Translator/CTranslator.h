#ifndef CTRANSLATOR
#define CTRANSLATOR

#include <QTranslator>
#include <QObject>
#include <QDebug>

/**
 * @brief The CTranslator class
 * 封装翻译类（多国语）
 */

class CTranslator :public QTranslator
{
    Q_OBJECT
public:
    ~CTranslator();
    /**
     * @brief deletePtr
     */
    void deletePtr();

signals:
    /**
     * @brief languageChanged
     */
    void languageChanged();

public slots:
    /**
     * @brief load 加载qm多国语
     * @param filename qm的文件名
     */
    void load(const QString &filename);

public:
    static CTranslator *instance();

private:
    CTranslator(QObject* parent = 0);
    CTranslator(const CTranslator& another);
    CTranslator& operator =(const CTranslator& another);
    static CTranslator *m_pInstance;
};

#endif // TRANSLATOR

