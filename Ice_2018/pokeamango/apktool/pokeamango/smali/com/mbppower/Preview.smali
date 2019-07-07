.class Lcom/mbppower/Preview;
.super Landroid/widget/RelativeLayout;
.source "CameraActivity.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# instance fields
.field private final TAG:Ljava/lang/String;

.field cameraId:I

.field displayOrientation:I

.field mCamera:Landroid/hardware/Camera;

.field mHolder:Landroid/view/SurfaceHolder;

.field mPreviewSize:Landroid/hardware/Camera$Size;

.field mSupportedPreviewSizes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/hardware/Camera$Size;",
            ">;"
        }
    .end annotation
.end field

.field mSurfaceView:Lcom/mbppower/CustomSurfaceView;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 511
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 500
    const-string v0, "Preview"

    iput-object v0, p0, Lcom/mbppower/Preview;->TAG:Ljava/lang/String;

    .line 513
    new-instance v0, Lcom/mbppower/CustomSurfaceView;

    invoke-direct {v0, p1}, Lcom/mbppower/CustomSurfaceView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mbppower/Preview;->mSurfaceView:Lcom/mbppower/CustomSurfaceView;

    .line 514
    iget-object v0, p0, Lcom/mbppower/Preview;->mSurfaceView:Lcom/mbppower/CustomSurfaceView;

    invoke-virtual {p0, v0}, Lcom/mbppower/Preview;->addView(Landroid/view/View;)V

    .line 516
    invoke-virtual {p0}, Lcom/mbppower/Preview;->requestLayout()V

    .line 520
    iget-object v0, p0, Lcom/mbppower/Preview;->mSurfaceView:Lcom/mbppower/CustomSurfaceView;

    invoke-virtual {v0}, Lcom/mbppower/CustomSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mbppower/Preview;->mHolder:Landroid/view/SurfaceHolder;

    .line 521
    iget-object v0, p0, Lcom/mbppower/Preview;->mHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 522
    iget-object v0, p0, Lcom/mbppower/Preview;->mHolder:Landroid/view/SurfaceHolder;

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 523
    return-void
.end method

.method private getOptimalPreviewSize(Ljava/util/List;II)Landroid/hardware/Camera$Size;
    .locals 18
    .param p2, "w"    # I
    .param p3, "h"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/hardware/Camera$Size;",
            ">;II)",
            "Landroid/hardware/Camera$Size;"
        }
    .end annotation

    .prologue
    .line 685
    .local p1, "sizes":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    const-wide v2, 0x3fb999999999999aL    # 0.1

    .line 686
    .local v2, "ASPECT_TOLERANCE":D
    move/from16 v0, p2

    int-to-double v14, v0

    move/from16 v0, p3

    int-to-double v0, v0

    move-wide/from16 v16, v0

    div-double v12, v14, v16

    .line 687
    .local v12, "targetRatio":D
    move-object/from16 v0, p0

    iget v11, v0, Lcom/mbppower/Preview;->displayOrientation:I

    const/16 v14, 0x5a

    if-eq v11, v14, :cond_0

    move-object/from16 v0, p0

    iget v11, v0, Lcom/mbppower/Preview;->displayOrientation:I

    const/16 v14, 0x10e

    if-ne v11, v14, :cond_1

    .line 688
    :cond_0
    move/from16 v0, p3

    int-to-double v14, v0

    move/from16 v0, p2

    int-to-double v0, v0

    move-wide/from16 v16, v0

    div-double v12, v14, v16

    .line 690
    :cond_1
    if-nez p1, :cond_2

    const/4 v6, 0x0

    .line 719
    :goto_0
    return-object v6

    .line 692
    :cond_2
    const/4 v6, 0x0

    .line 693
    .local v6, "optimalSize":Landroid/hardware/Camera$Size;
    const-wide v4, 0x7fefffffffffffffL    # Double.MAX_VALUE

    .line 695
    .local v4, "minDiff":D
    move/from16 v10, p3

    .line 698
    .local v10, "targetHeight":I
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_3
    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_4

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/hardware/Camera$Size;

    .line 699
    .local v7, "size":Landroid/hardware/Camera$Size;
    iget v14, v7, Landroid/hardware/Camera$Size;->width:I

    int-to-double v14, v14

    iget v0, v7, Landroid/hardware/Camera$Size;->height:I

    move/from16 v16, v0

    move/from16 v0, v16

    int-to-double v0, v0

    move-wide/from16 v16, v0

    div-double v8, v14, v16

    .line 700
    .local v8, "ratio":D
    sub-double v14, v8, v12

    invoke-static {v14, v15}, Ljava/lang/Math;->abs(D)D

    move-result-wide v14

    const-wide v16, 0x3fb999999999999aL    # 0.1

    cmpl-double v14, v14, v16

    if-gtz v14, :cond_3

    .line 701
    iget v14, v7, Landroid/hardware/Camera$Size;->height:I

    sub-int/2addr v14, v10

    invoke-static {v14}, Ljava/lang/Math;->abs(I)I

    move-result v14

    int-to-double v14, v14

    cmpg-double v14, v14, v4

    if-gez v14, :cond_3

    .line 702
    move-object v6, v7

    .line 703
    iget v14, v7, Landroid/hardware/Camera$Size;->height:I

    sub-int/2addr v14, v10

    invoke-static {v14}, Ljava/lang/Math;->abs(I)I

    move-result v14

    int-to-double v4, v14

    goto :goto_1

    .line 708
    .end local v7    # "size":Landroid/hardware/Camera$Size;
    .end local v8    # "ratio":D
    :cond_4
    if-nez v6, :cond_6

    .line 709
    const-wide v4, 0x7fefffffffffffffL    # Double.MAX_VALUE

    .line 710
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_5
    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_6

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/hardware/Camera$Size;

    .line 711
    .restart local v7    # "size":Landroid/hardware/Camera$Size;
    iget v14, v7, Landroid/hardware/Camera$Size;->height:I

    sub-int/2addr v14, v10

    invoke-static {v14}, Ljava/lang/Math;->abs(I)I

    move-result v14

    int-to-double v14, v14

    cmpg-double v14, v14, v4

    if-gez v14, :cond_5

    .line 712
    move-object v6, v7

    .line 713
    iget v14, v7, Landroid/hardware/Camera$Size;->height:I

    sub-int/2addr v14, v10

    invoke-static {v14}, Ljava/lang/Math;->abs(I)I

    move-result v14

    int-to-double v4, v14

    goto :goto_2

    .line 718
    .end local v7    # "size":Landroid/hardware/Camera$Size;
    :cond_6
    const-string v11, "Preview"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "optimal preview size: w: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    iget v15, v6, Landroid/hardware/Camera$Size;->width:I

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " h: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    iget v15, v6, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v11, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method private setCameraDisplayOrientation()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    .line 541
    new-instance v2, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v2}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 543
    .local v2, "info":Landroid/hardware/Camera$CameraInfo;
    invoke-virtual {p0}, Lcom/mbppower/Preview;->getContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v4

    .line 544
    invoke-virtual {v4}, Landroid/view/Display;->getRotation()I

    move-result v3

    .line 545
    .local v3, "rotation":I
    const/4 v0, 0x0

    .line 546
    .local v0, "degrees":I
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 548
    .local v1, "dm":Landroid/util/DisplayMetrics;
    iget v4, p0, Lcom/mbppower/Preview;->cameraId:I

    invoke-static {v4, v2}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 549
    invoke-virtual {p0}, Lcom/mbppower/Preview;->getContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 551
    packed-switch v3, :pswitch_data_0

    .line 566
    :goto_0
    iget v4, v2, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-ne v4, v7, :cond_0

    .line 567
    iget v4, v2, Landroid/hardware/Camera$CameraInfo;->orientation:I

    add-int/2addr v4, v0

    rem-int/lit16 v4, v4, 0x168

    iput v4, p0, Lcom/mbppower/Preview;->displayOrientation:I

    .line 568
    iget v4, p0, Lcom/mbppower/Preview;->displayOrientation:I

    rsub-int v4, v4, 0x168

    rem-int/lit16 v4, v4, 0x168

    iput v4, p0, Lcom/mbppower/Preview;->displayOrientation:I

    .line 573
    :goto_1
    const-string v4, "Preview"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "screen is rotated "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "deg from natural"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 574
    const-string v5, "Preview"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget v4, v2, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-ne v4, v7, :cond_1

    const-string v4, "front"

    :goto_2
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " camera is oriented -"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v6, v2, Landroid/hardware/Camera$CameraInfo;->orientation:I

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "deg from natural"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 576
    const-string v4, "Preview"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "need to rotate preview "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/mbppower/Preview;->displayOrientation:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "deg"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 577
    iget-object v4, p0, Lcom/mbppower/Preview;->mCamera:Landroid/hardware/Camera;

    iget v5, p0, Lcom/mbppower/Preview;->displayOrientation:I

    invoke-virtual {v4, v5}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    .line 578
    return-void

    .line 553
    :pswitch_0
    const/4 v0, 0x0

    .line 554
    goto/16 :goto_0

    .line 556
    :pswitch_1
    const/16 v0, 0x5a

    .line 557
    goto/16 :goto_0

    .line 559
    :pswitch_2
    const/16 v0, 0xb4

    .line 560
    goto/16 :goto_0

    .line 562
    :pswitch_3
    const/16 v0, 0x10e

    goto/16 :goto_0

    .line 570
    :cond_0
    iget v4, v2, Landroid/hardware/Camera$CameraInfo;->orientation:I

    sub-int/2addr v4, v0

    add-int/lit16 v4, v4, 0x168

    rem-int/lit16 v4, v4, 0x168

    iput v4, p0, Lcom/mbppower/Preview;->displayOrientation:I

    goto/16 :goto_1

    .line 574
    :cond_1
    const-string v4, "back"

    goto :goto_2

    .line 551
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method public getDisplayOrientation()I
    .locals 1

    .prologue
    .line 537
    iget v0, p0, Lcom/mbppower/Preview;->displayOrientation:I

    return v0
.end method

.method public getFramePicture([BLandroid/hardware/Camera;)[B
    .locals 10
    .param p1, "data"    # [B
    .param p2, "camera"    # Landroid/hardware/Camera;

    .prologue
    const/4 v9, 0x0

    .line 736
    invoke-virtual {p2}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v7

    .line 737
    .local v7, "parameters":Landroid/hardware/Camera$Parameters;
    invoke-virtual {v7}, Landroid/hardware/Camera$Parameters;->getPreviewFormat()I

    move-result v2

    .line 740
    .local v2, "format":I
    const/16 v1, 0x11

    if-eq v2, v1, :cond_0

    const/16 v1, 0x14

    if-eq v2, v1, :cond_0

    const/16 v1, 0x10

    if-ne v2, v1, :cond_1

    .line 741
    :cond_0
    invoke-virtual {v7}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v1

    iget v3, v1, Landroid/hardware/Camera$Size;->width:I

    .line 742
    .local v3, "w":I
    invoke-virtual {v7}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v1

    iget v4, v1, Landroid/hardware/Camera$Size;->height:I

    .line 745
    .local v4, "h":I
    new-instance v0, Landroid/graphics/YuvImage;

    const/4 v5, 0x0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Landroid/graphics/YuvImage;-><init>([BIII[I)V

    .line 747
    .local v0, "yuvImage":Landroid/graphics/YuvImage;
    new-instance v8, Landroid/graphics/Rect;

    invoke-direct {v8, v9, v9, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 748
    .local v8, "rect":Landroid/graphics/Rect;
    new-instance v6, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 749
    .local v6, "outputStream":Ljava/io/ByteArrayOutputStream;
    const/16 v1, 0x50

    invoke-virtual {v0, v8, v1, v6}, Landroid/graphics/YuvImage;->compressToJpeg(Landroid/graphics/Rect;ILjava/io/OutputStream;)Z

    .line 750
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    .line 752
    .end local v0    # "yuvImage":Landroid/graphics/YuvImage;
    .end local v3    # "w":I
    .end local v4    # "h":I
    .end local v6    # "outputStream":Ljava/io/ByteArrayOutputStream;
    .end local v8    # "rect":Landroid/graphics/Rect;
    .end local p1    # "data":[B
    :cond_1
    return-object p1
.end method

.method protected onLayout(ZIIII)V
    .locals 15
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 611
    if-eqz p1, :cond_3

    invoke-virtual {p0}, Lcom/mbppower/Preview;->getChildCount()I

    move-result v12

    if-lez v12, :cond_3

    .line 612
    const/4 v12, 0x0

    invoke-virtual {p0, v12}, Lcom/mbppower/Preview;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 614
    .local v0, "child":Landroid/view/View;
    sub-int v11, p4, p2

    .line 615
    .local v11, "width":I
    sub-int v1, p5, p3

    .line 617
    .local v1, "height":I
    move v6, v11

    .line 618
    .local v6, "previewWidth":I
    move v5, v1

    .line 620
    .local v5, "previewHeight":I
    iget-object v12, p0, Lcom/mbppower/Preview;->mPreviewSize:Landroid/hardware/Camera$Size;

    if-eqz v12, :cond_2

    .line 621
    iget-object v12, p0, Lcom/mbppower/Preview;->mPreviewSize:Landroid/hardware/Camera$Size;

    iget v6, v12, Landroid/hardware/Camera$Size;->width:I

    .line 622
    iget-object v12, p0, Lcom/mbppower/Preview;->mPreviewSize:Landroid/hardware/Camera$Size;

    iget v5, v12, Landroid/hardware/Camera$Size;->height:I

    .line 624
    iget v12, p0, Lcom/mbppower/Preview;->displayOrientation:I

    const/16 v13, 0x5a

    if-eq v12, v13, :cond_0

    iget v12, p0, Lcom/mbppower/Preview;->displayOrientation:I

    const/16 v13, 0x10e

    if-ne v12, v13, :cond_1

    .line 625
    :cond_0
    iget-object v12, p0, Lcom/mbppower/Preview;->mPreviewSize:Landroid/hardware/Camera$Size;

    iget v6, v12, Landroid/hardware/Camera$Size;->height:I

    .line 626
    iget-object v12, p0, Lcom/mbppower/Preview;->mPreviewSize:Landroid/hardware/Camera$Size;

    iget v5, v12, Landroid/hardware/Camera$Size;->width:I

    .line 629
    :cond_1
    const-string v12, "Preview"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "previewWidth:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " previewHeight:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 637
    :cond_2
    const/high16 v7, 0x3f800000    # 1.0f

    .line 640
    .local v7, "scale":F
    mul-int v12, v11, v5

    mul-int v13, v1, v6

    if-ge v12, v13, :cond_4

    .line 641
    const-string v12, "Preview"

    const-string v13, "center horizontally"

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 642
    mul-int v12, v6, v1

    div-int/2addr v12, v5

    int-to-float v12, v12

    mul-float/2addr v12, v7

    float-to-int v9, v12

    .line 643
    .local v9, "scaledChildWidth":I
    add-int v12, v11, v9

    div-int/lit8 v4, v12, 0x2

    .line 644
    .local v4, "nW":I
    int-to-float v12, v1

    mul-float/2addr v12, v7

    float-to-int v3, v12

    .line 645
    .local v3, "nH":I
    const/4 v10, 0x0

    .line 646
    .local v10, "top":I
    sub-int v12, v11, v9

    div-int/lit8 v2, v12, 0x2

    .line 656
    .end local v9    # "scaledChildWidth":I
    .local v2, "left":I
    :goto_0
    invoke-virtual {v0, v2, v10, v4, v3}, Landroid/view/View;->layout(IIII)V

    .line 658
    const-string v12, "layout"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "left:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 659
    const-string v12, "layout"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "top:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 660
    const-string v12, "layout"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "right:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 661
    const-string v12, "layout"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "bottom:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 663
    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "height":I
    .end local v2    # "left":I
    .end local v3    # "nH":I
    .end local v4    # "nW":I
    .end local v5    # "previewHeight":I
    .end local v6    # "previewWidth":I
    .end local v7    # "scale":F
    .end local v10    # "top":I
    .end local v11    # "width":I
    :cond_3
    return-void

    .line 649
    .restart local v0    # "child":Landroid/view/View;
    .restart local v1    # "height":I
    .restart local v5    # "previewHeight":I
    .restart local v6    # "previewWidth":I
    .restart local v7    # "scale":F
    .restart local v11    # "width":I
    :cond_4
    const-string v12, "Preview"

    const-string v13, "center vertically"

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 650
    mul-int v12, v5, v11

    div-int/2addr v12, v6

    int-to-float v12, v12

    mul-float/2addr v12, v7

    float-to-int v8, v12

    .line 651
    .local v8, "scaledChildHeight":I
    int-to-float v12, v11

    mul-float/2addr v12, v7

    float-to-int v4, v12

    .line 652
    .restart local v4    # "nW":I
    add-int v12, v1, v8

    div-int/lit8 v3, v12, 0x2

    .line 653
    .restart local v3    # "nH":I
    sub-int v12, v1, v8

    div-int/lit8 v10, v12, 0x2

    .line 654
    .restart local v10    # "top":I
    const/4 v2, 0x0

    .restart local v2    # "left":I
    goto :goto_0
.end method

.method protected onMeasure(II)V
    .locals 3
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 599
    invoke-virtual {p0}, Lcom/mbppower/Preview;->getSuggestedMinimumWidth()I

    move-result v2

    invoke-static {v2, p1}, Lcom/mbppower/Preview;->resolveSize(II)I

    move-result v1

    .line 600
    .local v1, "width":I
    invoke-virtual {p0}, Lcom/mbppower/Preview;->getSuggestedMinimumHeight()I

    move-result v2

    invoke-static {v2, p2}, Lcom/mbppower/Preview;->resolveSize(II)I

    move-result v0

    .line 601
    .local v0, "height":I
    invoke-virtual {p0, v1, v0}, Lcom/mbppower/Preview;->setMeasuredDimension(II)V

    .line 603
    iget-object v2, p0, Lcom/mbppower/Preview;->mSupportedPreviewSizes:Ljava/util/List;

    if-eqz v2, :cond_0

    .line 604
    iget-object v2, p0, Lcom/mbppower/Preview;->mSupportedPreviewSizes:Ljava/util/List;

    invoke-direct {p0, v2, v1, v0}, Lcom/mbppower/Preview;->getOptimalPreviewSize(Ljava/util/List;II)Landroid/hardware/Camera$Size;

    move-result-object v2

    iput-object v2, p0, Lcom/mbppower/Preview;->mPreviewSize:Landroid/hardware/Camera$Size;

    .line 606
    :cond_0
    return-void
.end method

.method public setCamera(Landroid/hardware/Camera;I)V
    .locals 1
    .param p1, "camera"    # Landroid/hardware/Camera;
    .param p2, "cameraId"    # I

    .prologue
    .line 526
    iput-object p1, p0, Lcom/mbppower/Preview;->mCamera:Landroid/hardware/Camera;

    .line 527
    iput p2, p0, Lcom/mbppower/Preview;->cameraId:I

    .line 528
    iget-object v0, p0, Lcom/mbppower/Preview;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 529
    iget-object v0, p0, Lcom/mbppower/Preview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/mbppower/Preview;->mSupportedPreviewSizes:Ljava/util/List;

    .line 530
    invoke-direct {p0}, Lcom/mbppower/Preview;->setCameraDisplayOrientation()V

    .line 534
    :cond_0
    return-void
.end method

.method public setOneShotPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V
    .locals 1
    .param p1, "callback"    # Landroid/hardware/Camera$PreviewCallback;

    .prologue
    .line 755
    iget-object v0, p0, Lcom/mbppower/Preview;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 756
    iget-object v0, p0, Lcom/mbppower/Preview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0, p1}, Landroid/hardware/Camera;->setOneShotPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 758
    :cond_0
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 3
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "w"    # I
    .param p4, "h"    # I

    .prologue
    .line 723
    iget-object v1, p0, Lcom/mbppower/Preview;->mCamera:Landroid/hardware/Camera;

    if-eqz v1, :cond_0

    .line 726
    iget-object v1, p0, Lcom/mbppower/Preview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 727
    .local v0, "parameters":Landroid/hardware/Camera$Parameters;
    iget-object v1, p0, Lcom/mbppower/Preview;->mPreviewSize:Landroid/hardware/Camera$Size;

    iget v1, v1, Landroid/hardware/Camera$Size;->width:I

    iget-object v2, p0, Lcom/mbppower/Preview;->mPreviewSize:Landroid/hardware/Camera$Size;

    iget v2, v2, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v0, v1, v2}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 728
    invoke-virtual {p0}, Lcom/mbppower/Preview;->requestLayout()V

    .line 730
    iget-object v1, p0, Lcom/mbppower/Preview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 731
    iget-object v1, p0, Lcom/mbppower/Preview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->startPreview()V

    .line 733
    .end local v0    # "parameters":Landroid/hardware/Camera$Parameters;
    :cond_0
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 3
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 669
    :try_start_0
    iget-object v1, p0, Lcom/mbppower/Preview;->mCamera:Landroid/hardware/Camera;

    if-eqz v1, :cond_0

    .line 670
    iget-object v1, p0, Lcom/mbppower/Preview;->mSurfaceView:Lcom/mbppower/CustomSurfaceView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/mbppower/CustomSurfaceView;->setWillNotDraw(Z)V

    .line 671
    iget-object v1, p0, Lcom/mbppower/Preview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1, p1}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 676
    :cond_0
    :goto_0
    return-void

    .line 673
    :catch_0
    move-exception v0

    .line 674
    .local v0, "exception":Ljava/io/IOException;
    const-string v1, "Preview"

    const-string v2, "IOException caused by setPreviewDisplay()"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 680
    iget-object v0, p0, Lcom/mbppower/Preview;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 681
    iget-object v0, p0, Lcom/mbppower/Preview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 683
    :cond_0
    return-void
.end method

.method public switchCamera(Landroid/hardware/Camera;I)V
    .locals 4
    .param p1, "camera"    # Landroid/hardware/Camera;
    .param p2, "cameraId"    # I

    .prologue
    .line 581
    invoke-virtual {p0, p1, p2}, Lcom/mbppower/Preview;->setCamera(Landroid/hardware/Camera;I)V

    .line 583
    :try_start_0
    iget-object v2, p0, Lcom/mbppower/Preview;->mHolder:Landroid/view/SurfaceHolder;

    invoke-virtual {p1, v2}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V

    .line 584
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    .line 585
    .local v1, "parameters":Landroid/hardware/Camera$Parameters;
    iget-object v2, p0, Lcom/mbppower/Preview;->mPreviewSize:Landroid/hardware/Camera$Size;

    iget v2, v2, Landroid/hardware/Camera$Size;->width:I

    iget-object v3, p0, Lcom/mbppower/Preview;->mPreviewSize:Landroid/hardware/Camera$Size;

    iget v3, v3, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v1, v2, v3}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 586
    invoke-virtual {p1, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 592
    .end local v1    # "parameters":Landroid/hardware/Camera$Parameters;
    :goto_0
    return-void

    .line 588
    :catch_0
    move-exception v0

    .line 589
    .local v0, "exception":Ljava/io/IOException;
    const-string v2, "Preview"

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
