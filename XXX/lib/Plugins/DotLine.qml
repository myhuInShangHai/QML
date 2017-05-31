import QtQuick 2.0

// 虚线
Item {

    property real startX: 0;        //起始位置X的坐标值
    property real startY: 0;        //起始位置Y的坐标值
    property real endX: 0;          //结束位置X的坐标值
    property real endY: 0;          //结束位置Y的坐标值
    property bool dashed: true;     //使用虚线的标志位 true:使用; false:不使用（即直线）
    property real dashLength: 5;    //虚线部分有线段的长度
    property real dashSpace: 5;     //虚线部分空白的长度
    property real lineWidth: 10;    //线段的宽度
    property real stippleLength: (dashLength + dashSpace) > 0 ? (dashLength + dashSpace) : 16; //虚线与空白的长度（dashLength + dashSpace）
    property color drawColor: "#cdcdcd";  //线段的颜色

    Canvas {
        id: canvas;
        anchors.fill: parent;

        onPaint: {
            // Get the drawing context
            var ctx = canvas.getContext('2d');
            // set line color
            ctx.strokeStyle = drawColor;
            ctx.lineWidth = lineWidth;
            ctx.beginPath();

            if (!dashed)
            {
                ctx.moveTo(startX,startY);
                ctx.lineTo(endX,endY);
            }
            else {
                var dashLen = stippleLength;
                var dX = endX - startX;
                var dY = endY - startY;
                var dashes = Math.floor(Math.sqrt(dX * dX + dY * dY) / dashLen);
                if (dashes == 0)
                {
                    dashes = 1;
                }
                var dash_to_length = dashLength/dashLen;
                var space_to_length = 1 - dash_to_length;
                var dashX = dX / dashes;
                var dashY = dY / dashes;
                var x1 = startX;
                var y1 = startY;

                ctx.moveTo(x1,y1);

                var q = 0;
                while (q++ < dashes) {
                    x1 += dashX*dash_to_length;
                    y1 += dashY*dash_to_length;
                    ctx.lineTo(x1, y1);
                    x1 += dashX*space_to_length;
                    y1 += dashY*space_to_length;
                    ctx.moveTo(x1, y1);
                }
            }
            ctx.stroke();
        }
    }
}
