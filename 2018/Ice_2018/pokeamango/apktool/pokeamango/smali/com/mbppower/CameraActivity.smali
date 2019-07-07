.class public Lcom/mbppower/CameraActivity;
.super Landroid/app/Fragment;
.source "CameraActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mbppower/CameraActivity$CameraPreviewListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "CameraActivity"


# instance fields
.field private appResourcesPackage:Ljava/lang/String;

.field private cameraCurrentlyLocked:I

.field private cameraParameters:Landroid/hardware/Camera$Parameters;

.field private canTakePicture:Z

.field public defaultCamera:Ljava/lang/String;

.field private defaultCameraId:I

.field public dragEnabled:Z

.field private eventListener:Lcom/mbppower/CameraActivity$CameraPreviewListener;

.field public frameContainerLayout:Landroid/widget/FrameLayout;

.field public height:I

.field private mCamera:Landroid/hardware/Camera;

.field private mPreview:Lcom/mbppower/Preview;

.field public mainLayout:Landroid/widget/FrameLayout;

.field private numberOfCameras:I

.field public tapToTakePicture:Z

.field private view:Landroid/view/View;

.field public width:I

.field public x:I

.field public y:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 54
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mbppower/CameraActivity;->canTakePicture:Z

    return-void
.end method

.method static synthetic access$000(Lcom/mbppower/CameraActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/mbppower/CameraActivity;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->appResourcesPackage:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mbppower/CameraActivity;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/mbppower/CameraActivity;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->view:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mbppower/CameraActivity;)Lcom/mbppower/Preview;
    .locals 1
    .param p0, "x0"    # Lcom/mbppower/CameraActivity;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->mPreview:Lcom/mbppower/Preview;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mbppower/CameraActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/mbppower/CameraActivity;

    .prologue
    .line 42
    iget v0, p0, Lcom/mbppower/CameraActivity;->cameraCurrentlyLocked:I

    return v0
.end method

.method static synthetic access$400(Lcom/mbppower/CameraActivity;Landroid/view/View;)Landroid/graphics/Bitmap;
    .locals 1
    .param p0, "x0"    # Lcom/mbppower/CameraActivity;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/mbppower/CameraActivity;->loadBitmapFromView(Landroid/view/View;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/mbppower/CameraActivity;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 0
    .param p0, "x0"    # Lcom/mbppower/CameraActivity;
    .param p1, "x1"    # Landroid/graphics/Bitmap;
    .param p2, "x2"    # Landroid/graphics/Bitmap;

    .prologue
    .line 42
    invoke-direct {p0, p1, p2}, Lcom/mbppower/CameraActivity;->generatePictureFromView(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method static synthetic access$602(Lcom/mbppower/CameraActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/mbppower/CameraActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 42
    iput-boolean p1, p0, Lcom/mbppower/CameraActivity;->canTakePicture:Z

    return p1
.end method

.method static synthetic access$700(Lcom/mbppower/CameraActivity;Landroid/graphics/Bitmap;Ljava/lang/String;)Ljava/io/File;
    .locals 1
    .param p0, "x0"    # Lcom/mbppower/CameraActivity;
    .param p1, "x1"    # Landroid/graphics/Bitmap;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0, p1, p2}, Lcom/mbppower/CameraActivity;->storeImage(Landroid/graphics/Bitmap;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$800(Lcom/mbppower/CameraActivity;)Lcom/mbppower/CameraActivity$CameraPreviewListener;
    .locals 1
    .param p0, "x0"    # Lcom/mbppower/CameraActivity;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->eventListener:Lcom/mbppower/CameraActivity$CameraPreviewListener;

    return-object v0
.end method

.method private createCameraPreview()V
    .locals 9

    .prologue
    const/4 v8, -0x1

    const/4 v7, 0x0

    .line 101
    iget-object v2, p0, Lcom/mbppower/CameraActivity;->mPreview:Lcom/mbppower/Preview;

    if-nez v2, :cond_0

    .line 102
    invoke-direct {p0}, Lcom/mbppower/CameraActivity;->setDefaultCameraId()V

    .line 105
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    iget v2, p0, Lcom/mbppower/CameraActivity;->width:I

    iget v3, p0, Lcom/mbppower/CameraActivity;->height:I

    invoke-direct {v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 106
    .local v1, "layoutParams":Landroid/widget/FrameLayout$LayoutParams;
    iget v2, p0, Lcom/mbppower/CameraActivity;->x:I

    iget v3, p0, Lcom/mbppower/CameraActivity;->y:I

    invoke-virtual {v1, v2, v3, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 107
    iget-object v2, p0, Lcom/mbppower/CameraActivity;->view:Landroid/view/View;

    invoke-virtual {p0}, Lcom/mbppower/CameraActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "frame_container"

    const-string v5, "id"

    iget-object v6, p0, Lcom/mbppower/CameraActivity;->appResourcesPackage:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout;

    iput-object v2, p0, Lcom/mbppower/CameraActivity;->frameContainerLayout:Landroid/widget/FrameLayout;

    .line 108
    iget-object v2, p0, Lcom/mbppower/CameraActivity;->frameContainerLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 111
    new-instance v2, Lcom/mbppower/Preview;

    invoke-virtual {p0}, Lcom/mbppower/CameraActivity;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/mbppower/Preview;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/mbppower/CameraActivity;->mPreview:Lcom/mbppower/Preview;

    .line 112
    iget-object v2, p0, Lcom/mbppower/CameraActivity;->view:Landroid/view/View;

    invoke-virtual {p0}, Lcom/mbppower/CameraActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "video_view"

    const-string v5, "id"

    iget-object v6, p0, Lcom/mbppower/CameraActivity;->appResourcesPackage:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout;

    iput-object v2, p0, Lcom/mbppower/CameraActivity;->mainLayout:Landroid/widget/FrameLayout;

    .line 113
    iget-object v2, p0, Lcom/mbppower/CameraActivity;->mainLayout:Landroid/widget/FrameLayout;

    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v3, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 114
    iget-object v2, p0, Lcom/mbppower/CameraActivity;->mainLayout:Landroid/widget/FrameLayout;

    iget-object v3, p0, Lcom/mbppower/CameraActivity;->mPreview:Lcom/mbppower/Preview;

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 115
    iget-object v2, p0, Lcom/mbppower/CameraActivity;->mainLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v7}, Landroid/widget/FrameLayout;->setEnabled(Z)V

    .line 117
    new-instance v0, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/mbppower/CameraActivity;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Lcom/mbppower/TapGestureDetector;

    invoke-direct {v3}, Lcom/mbppower/TapGestureDetector;-><init>()V

    invoke-direct {v0, v2, v3}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 119
    .local v0, "gestureDetector":Landroid/view/GestureDetector;
    invoke-virtual {p0}, Lcom/mbppower/CameraActivity;->getActivity()Landroid/app/Activity;

    move-result-object v2

    new-instance v3, Lcom/mbppower/CameraActivity$1;

    invoke-direct {v3, p0, v0}, Lcom/mbppower/CameraActivity$1;-><init>(Lcom/mbppower/CameraActivity;Landroid/view/GestureDetector;)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 190
    .end local v0    # "gestureDetector":Landroid/view/GestureDetector;
    .end local v1    # "layoutParams":Landroid/widget/FrameLayout$LayoutParams;
    :cond_0
    return-void
.end method

.method private generatePictureFromView(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 7
    .param p1, "originalPicture"    # Landroid/graphics/Bitmap;
    .param p2, "picture"    # Landroid/graphics/Bitmap;

    .prologue
    .line 396
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->view:Landroid/view/View;

    invoke-virtual {p0}, Lcom/mbppower/CameraActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "camera_loader"

    const-string v3, "id"

    iget-object v6, p0, Lcom/mbppower/CameraActivity;->appResourcesPackage:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/FrameLayout;

    .line 397
    .local v4, "cameraLoader":Landroid/widget/FrameLayout;
    const/4 v0, 0x0

    invoke-virtual {v4, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 398
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->view:Landroid/view/View;

    invoke-virtual {p0}, Lcom/mbppower/CameraActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "picture_view"

    const-string v3, "id"

    iget-object v6, p0, Lcom/mbppower/CameraActivity;->appResourcesPackage:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 399
    .local v5, "pictureView":Landroid/widget/ImageView;
    new-instance v0, Lcom/mbppower/CameraActivity$4;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/mbppower/CameraActivity$4;-><init>(Lcom/mbppower/CameraActivity;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/widget/FrameLayout;Landroid/widget/ImageView;)V

    .line 427
    invoke-virtual {v0}, Lcom/mbppower/CameraActivity$4;->start()V

    .line 428
    return-void
.end method

.method private getOutputMediaFile(Ljava/lang/String;)Ljava/io/File;
    .locals 6
    .param p1, "suffix"    # Ljava/lang/String;

    .prologue
    .line 432
    invoke-virtual {p0}, Lcom/mbppower/CameraActivity;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    .line 436
    .local v2, "mediaStorageDir":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 437
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v4

    if-nez v4, :cond_0

    .line 438
    const/4 v1, 0x0

    .line 446
    :goto_0
    return-object v1

    .line 442
    :cond_0
    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v5, "dd_MM_yyyy_HHmm_ss"

    invoke-direct {v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v4, v5}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    .line 444
    .local v3, "timeStamp":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "camerapreview_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".jpg"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 445
    .local v0, "mImageName":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 446
    .local v1, "mediaFile":Ljava/io/File;
    goto :goto_0
.end method

.method private loadBitmapFromView(Landroid/view/View;)Landroid/graphics/Bitmap;
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 485
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 486
    .local v0, "b":Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 487
    .local v1, "c":Landroid/graphics/Canvas;
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v4

    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result v5

    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/view/View;->layout(IIII)V

    .line 488
    invoke-virtual {p1, v1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 489
    return-object v0
.end method

.method private setDefaultCameraId()V
    .locals 5

    .prologue
    .line 195
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    move-result v3

    iput v3, p0, Lcom/mbppower/CameraActivity;->numberOfCameras:I

    .line 197
    iget-object v3, p0, Lcom/mbppower/CameraActivity;->defaultCamera:Ljava/lang/String;

    const-string v4, "front"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v0, 0x1

    .line 200
    .local v0, "camId":I
    :goto_0
    new-instance v1, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v1}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 201
    .local v1, "cameraInfo":Landroid/hardware/Camera$CameraInfo;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget v3, p0, Lcom/mbppower/CameraActivity;->numberOfCameras:I

    if-ge v2, v3, :cond_0

    .line 202
    invoke-static {v2, v1}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 203
    iget v3, v1, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-ne v3, v0, :cond_2

    .line 204
    iput v0, p0, Lcom/mbppower/CameraActivity;->defaultCameraId:I

    .line 208
    :cond_0
    return-void

    .line 197
    .end local v0    # "camId":I
    .end local v1    # "cameraInfo":Landroid/hardware/Camera$CameraInfo;
    .end local v2    # "i":I
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 201
    .restart local v0    # "camId":I
    .restart local v1    # "cameraInfo":Landroid/hardware/Camera$CameraInfo;
    .restart local v2    # "i":I
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method private storeImage(Landroid/graphics/Bitmap;Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .param p1, "image"    # Landroid/graphics/Bitmap;
    .param p2, "suffix"    # Ljava/lang/String;

    .prologue
    .line 450
    invoke-direct {p0, p2}, Lcom/mbppower/CameraActivity;->getOutputMediaFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 451
    .local v1, "pictureFile":Ljava/io/File;
    if-eqz v1, :cond_0

    .line 453
    :try_start_0
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 454
    .local v0, "fos":Ljava/io/FileOutputStream;
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v3, 0x50

    invoke-virtual {p1, v2, v3, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 455
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 461
    .end local v0    # "fos":Ljava/io/FileOutputStream;
    .end local v1    # "pictureFile":Ljava/io/File;
    :goto_0
    return-object v1

    .line 458
    .restart local v1    # "pictureFile":Ljava/io/File;
    :catch_0
    move-exception v2

    .line 461
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public calculateInSampleSize(Landroid/graphics/BitmapFactory$Options;II)I
    .locals 6
    .param p1, "options"    # Landroid/graphics/BitmapFactory$Options;
    .param p2, "reqWidth"    # I
    .param p3, "reqHeight"    # I

    .prologue
    .line 466
    iget v2, p1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 467
    .local v2, "height":I
    iget v4, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 468
    .local v4, "width":I
    const/4 v3, 0x1

    .line 470
    .local v3, "inSampleSize":I
    if-gt v2, p3, :cond_0

    if-le v4, p2, :cond_1

    .line 472
    :cond_0
    div-int/lit8 v0, v2, 0x2

    .line 473
    .local v0, "halfHeight":I
    div-int/lit8 v1, v4, 0x2

    .line 477
    .local v1, "halfWidth":I
    :goto_0
    div-int v5, v0, v3

    if-le v5, p3, :cond_1

    div-int v5, v1, v3

    if-le v5, p2, :cond_1

    .line 478
    mul-int/lit8 v3, v3, 0x2

    goto :goto_0

    .line 481
    .end local v0    # "halfHeight":I
    .end local v1    # "halfWidth":I
    :cond_1
    return v3
.end method

.method public cropBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;)Landroid/graphics/Bitmap;
    .locals 7
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "rect"    # Landroid/graphics/Rect;

    .prologue
    .line 312
    iget v4, p2, Landroid/graphics/Rect;->right:I

    iget v5, p2, Landroid/graphics/Rect;->left:I

    sub-int v3, v4, v5

    .line 313
    .local v3, "w":I
    iget v4, p2, Landroid/graphics/Rect;->bottom:I

    iget v5, p2, Landroid/graphics/Rect;->top:I

    sub-int v1, v4, v5

    .line 314
    .local v1, "h":I
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v4

    invoke-static {v3, v1, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 315
    .local v2, "ret":Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 316
    .local v0, "canvas":Landroid/graphics/Canvas;
    iget v4, p2, Landroid/graphics/Rect;->left:I

    neg-int v4, v4

    int-to-float v4, v4

    iget v5, p2, Landroid/graphics/Rect;->top:I

    neg-int v5, v5

    int-to-float v5, v5

    const/4 v6, 0x0

    invoke-virtual {v0, p1, v4, v5, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 317
    return-object v2
.end method

.method public getCamera()Landroid/hardware/Camera;
    .locals 1

    .prologue
    .line 263
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->mCamera:Landroid/hardware/Camera;

    return-object v0
.end method

.method public hasFrontCamera()Z
    .locals 2

    .prologue
    .line 308
    invoke-virtual {p0}, Lcom/mbppower/CameraActivity;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "android.hardware.camera.front"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 91
    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 92
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 81
    invoke-virtual {p0}, Lcom/mbppower/CameraActivity;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mbppower/CameraActivity;->appResourcesPackage:Ljava/lang/String;

    .line 84
    invoke-virtual {p0}, Lcom/mbppower/CameraActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "camera_activity"

    const-string v2, "layout"

    iget-object v3, p0, Lcom/mbppower/CameraActivity;->appResourcesPackage:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mbppower/CameraActivity;->view:Landroid/view/View;

    .line 85
    invoke-direct {p0}, Lcom/mbppower/CameraActivity;->createCameraPreview()V

    .line 86
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->view:Landroid/view/View;

    return-object v0
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 494
    invoke-super {p0}, Landroid/app/Fragment;->onDestroy()V

    .line 495
    return-void
.end method

.method public onPause()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 251
    invoke-super {p0}, Landroid/app/Fragment;->onPause()V

    .line 255
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 256
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->mPreview:Lcom/mbppower/Preview;

    const/4 v1, -0x1

    invoke-virtual {v0, v2, v1}, Lcom/mbppower/Preview;->setCamera(Landroid/hardware/Camera;I)V

    .line 257
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 258
    iput-object v2, p0, Lcom/mbppower/CameraActivity;->mCamera:Landroid/hardware/Camera;

    .line 260
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 7

    .prologue
    .line 212
    invoke-super {p0}, Landroid/app/Fragment;->onResume()V

    .line 214
    iget v2, p0, Lcom/mbppower/CameraActivity;->defaultCameraId:I

    invoke-static {v2}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v2

    iput-object v2, p0, Lcom/mbppower/CameraActivity;->mCamera:Landroid/hardware/Camera;

    .line 216
    iget-object v2, p0, Lcom/mbppower/CameraActivity;->cameraParameters:Landroid/hardware/Camera$Parameters;

    if-eqz v2, :cond_0

    .line 217
    iget-object v2, p0, Lcom/mbppower/CameraActivity;->mCamera:Landroid/hardware/Camera;

    iget-object v3, p0, Lcom/mbppower/CameraActivity;->cameraParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v2, v3}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 220
    :cond_0
    iget v2, p0, Lcom/mbppower/CameraActivity;->defaultCameraId:I

    iput v2, p0, Lcom/mbppower/CameraActivity;->cameraCurrentlyLocked:I

    .line 222
    iget-object v2, p0, Lcom/mbppower/CameraActivity;->mPreview:Lcom/mbppower/Preview;

    iget-object v2, v2, Lcom/mbppower/Preview;->mPreviewSize:Landroid/hardware/Camera$Size;

    if-nez v2, :cond_2

    .line 223
    iget-object v2, p0, Lcom/mbppower/CameraActivity;->mPreview:Lcom/mbppower/Preview;

    iget-object v3, p0, Lcom/mbppower/CameraActivity;->mCamera:Landroid/hardware/Camera;

    iget v4, p0, Lcom/mbppower/CameraActivity;->cameraCurrentlyLocked:I

    invoke-virtual {v2, v3, v4}, Lcom/mbppower/Preview;->setCamera(Landroid/hardware/Camera;I)V

    .line 229
    :goto_0
    const-string v2, "CameraActivity"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "cameraCurrentlyLocked:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/mbppower/CameraActivity;->cameraCurrentlyLocked:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    iget-object v2, p0, Lcom/mbppower/CameraActivity;->view:Landroid/view/View;

    invoke-virtual {p0}, Lcom/mbppower/CameraActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "frame_container"

    const-string v5, "id"

    iget-object v6, p0, Lcom/mbppower/CameraActivity;->appResourcesPackage:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 232
    .local v0, "frameContainerLayout":Landroid/widget/FrameLayout;
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    .line 233
    .local v1, "viewTreeObserver":Landroid/view/ViewTreeObserver;
    invoke-virtual {v1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 234
    new-instance v2, Lcom/mbppower/CameraActivity$2;

    invoke-direct {v2, p0, v0}, Lcom/mbppower/CameraActivity$2;-><init>(Lcom/mbppower/CameraActivity;Landroid/widget/FrameLayout;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 247
    :cond_1
    return-void

    .line 225
    .end local v0    # "frameContainerLayout":Landroid/widget/FrameLayout;
    .end local v1    # "viewTreeObserver":Landroid/view/ViewTreeObserver;
    :cond_2
    iget-object v2, p0, Lcom/mbppower/CameraActivity;->mPreview:Lcom/mbppower/Preview;

    iget-object v3, p0, Lcom/mbppower/CameraActivity;->mCamera:Landroid/hardware/Camera;

    iget v4, p0, Lcom/mbppower/CameraActivity;->cameraCurrentlyLocked:I

    invoke-virtual {v2, v3, v4}, Lcom/mbppower/Preview;->switchCamera(Landroid/hardware/Camera;I)V

    .line 226
    iget-object v2, p0, Lcom/mbppower/CameraActivity;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v2}, Landroid/hardware/Camera;->startPreview()V

    goto :goto_0
.end method

.method public setCameraParameters(Landroid/hardware/Camera$Parameters;)V
    .locals 2
    .param p1, "params"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 300
    iput-object p1, p0, Lcom/mbppower/CameraActivity;->cameraParameters:Landroid/hardware/Camera$Parameters;

    .line 302
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mbppower/CameraActivity;->cameraParameters:Landroid/hardware/Camera$Parameters;

    if-eqz v0, :cond_0

    .line 303
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->mCamera:Landroid/hardware/Camera;

    iget-object v1, p0, Lcom/mbppower/CameraActivity;->cameraParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 305
    :cond_0
    return-void
.end method

.method public setEventListener(Lcom/mbppower/CameraActivity$CameraPreviewListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/mbppower/CameraActivity$CameraPreviewListener;

    .prologue
    .line 74
    iput-object p1, p0, Lcom/mbppower/CameraActivity;->eventListener:Lcom/mbppower/CameraActivity$CameraPreviewListener;

    .line 75
    return-void
.end method

.method public setRect(IIII)V
    .locals 0
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 94
    iput p1, p0, Lcom/mbppower/CameraActivity;->x:I

    .line 95
    iput p2, p0, Lcom/mbppower/CameraActivity;->y:I

    .line 96
    iput p3, p0, Lcom/mbppower/CameraActivity;->width:I

    .line 97
    iput p4, p0, Lcom/mbppower/CameraActivity;->height:I

    .line 98
    return-void
.end method

.method public switchCamera()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 268
    iget v0, p0, Lcom/mbppower/CameraActivity;->numberOfCameras:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 271
    :cond_0
    const-string v0, "CameraActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "numberOfCameras: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mbppower/CameraActivity;->numberOfCameras:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_1

    .line 276
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 277
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->mPreview:Lcom/mbppower/Preview;

    const/4 v1, -0x1

    invoke-virtual {v0, v3, v1}, Lcom/mbppower/Preview;->setCamera(Landroid/hardware/Camera;I)V

    .line 278
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 279
    iput-object v3, p0, Lcom/mbppower/CameraActivity;->mCamera:Landroid/hardware/Camera;

    .line 284
    :cond_1
    iget v0, p0, Lcom/mbppower/CameraActivity;->cameraCurrentlyLocked:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Lcom/mbppower/CameraActivity;->numberOfCameras:I

    rem-int/2addr v0, v1

    invoke-static {v0}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v0

    iput-object v0, p0, Lcom/mbppower/CameraActivity;->mCamera:Landroid/hardware/Camera;

    .line 286
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->cameraParameters:Landroid/hardware/Camera$Parameters;

    if-eqz v0, :cond_2

    .line 287
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->mCamera:Landroid/hardware/Camera;

    iget-object v1, p0, Lcom/mbppower/CameraActivity;->cameraParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 290
    :cond_2
    iget v0, p0, Lcom/mbppower/CameraActivity;->cameraCurrentlyLocked:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Lcom/mbppower/CameraActivity;->numberOfCameras:I

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/mbppower/CameraActivity;->cameraCurrentlyLocked:I

    .line 291
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->mPreview:Lcom/mbppower/Preview;

    iget-object v1, p0, Lcom/mbppower/CameraActivity;->mCamera:Landroid/hardware/Camera;

    iget v2, p0, Lcom/mbppower/CameraActivity;->cameraCurrentlyLocked:I

    invoke-virtual {v0, v1, v2}, Lcom/mbppower/Preview;->switchCamera(Landroid/hardware/Camera;I)V

    .line 293
    const-string v0, "CameraActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cameraCurrentlyLocked new: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mbppower/CameraActivity;->cameraCurrentlyLocked:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->startPreview()V

    .line 297
    return-void
.end method

.method public takePicture(DD)V
    .locals 9
    .param p1, "maxWidth"    # D
    .param p3, "maxHeight"    # D

    .prologue
    .line 321
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->view:Landroid/view/View;

    invoke-virtual {p0}, Lcom/mbppower/CameraActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "picture_view"

    const-string v4, "id"

    iget-object v5, p0, Lcom/mbppower/CameraActivity;->appResourcesPackage:Ljava/lang/String;

    invoke-virtual {v1, v2, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 322
    .local v3, "pictureView":Landroid/widget/ImageView;
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->mPreview:Lcom/mbppower/Preview;

    if-eqz v0, :cond_1

    .line 324
    iget-boolean v0, p0, Lcom/mbppower/CameraActivity;->canTakePicture:Z

    if-nez v0, :cond_0

    .line 393
    :goto_0
    return-void

    .line 327
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mbppower/CameraActivity;->canTakePicture:Z

    .line 329
    iget-object v0, p0, Lcom/mbppower/CameraActivity;->mPreview:Lcom/mbppower/Preview;

    new-instance v1, Lcom/mbppower/CameraActivity$3;

    move-object v2, p0

    move-wide v4, p1

    move-wide v6, p3

    invoke-direct/range {v1 .. v7}, Lcom/mbppower/CameraActivity$3;-><init>(Lcom/mbppower/CameraActivity;Landroid/widget/ImageView;DD)V

    invoke-virtual {v0, v1}, Lcom/mbppower/Preview;->setOneShotPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    goto :goto_0

    .line 391
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mbppower/CameraActivity;->canTakePicture:Z

    goto :goto_0
.end method
