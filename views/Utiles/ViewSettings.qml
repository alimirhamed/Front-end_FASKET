import QtQuick 2.15

Item {
    id: viewSettings

    property string backgroundColor: "#E9E9E9"
    property string primaryColor: "#0A51D7"
    property string opacityColor: "#7FAFFF"
    property string focusColor : "#191641"

    property string danaUltraBoldFont:dana_UltraBold.name

    FontLoader{
        id:dana_UltraBold
        source: "../../Assets/DanaUltraBold.ttf"
    }

    property string danaBoldFont: danaBold.name
    property string danaFuNumBoldFont: dana_funumBold.name
    property string danaFont: dana.name
    property string danaFuNumFont: dana_funum.name
    property string helveticaFont: helvetica.name

    FontLoader {
        id: dana
        source: "../../Assets/Dana.ttf"
    }
    FontLoader {
        id: dana_funum
        source: "../../Assets/DanaFa.ttf"
    }
    FontLoader {
        id: danaBold
        source: "../../Assets/DanaBold.ttf"
    }
    FontLoader {
        id: dana_funumBold
        source: "../../Assets/DanaFaBold.ttf"
    }

    FontLoader{
        id:helvetica
        source: "../../Assets/Helvetica.otf"
    }
}
