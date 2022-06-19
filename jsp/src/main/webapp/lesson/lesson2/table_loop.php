<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        table{
            border:#ccc solid 1px;
            border-collapse: collapse;
            margin:0 auto;
            text-align: center;
            width:80vw;
        }
        td{
            border:#ccc solid 1px;
            text-align: center;
        }
    </style>
</head>
<body>
<table>
    <tbody>
        <?php for ($i = 0;$i< 10;$i++){?>
            <tr>
            <?php for ($j = 0;$j< 5;$j++){?>
<!--                <td>--><?php //echo "第".$i."行"."第".$j."列"?><!--</td>-->
                <td><?php echo "第".$i."行"."第".$j."列"?></td>
            <?php }?>
            </tr>
        <?php }?>
    </tbody>
</table>
</body>
</html>