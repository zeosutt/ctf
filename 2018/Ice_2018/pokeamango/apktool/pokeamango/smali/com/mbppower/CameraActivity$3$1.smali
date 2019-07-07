.class Lcom/mbppower/CameraActivity$3$1;
.super Ljava/lang/Thread;
.source "CameraActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mbppower/CameraActivity$3;->onPreviewFrame([BLandroid/hardware/Camera;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mbppower/CameraActivity$3;

.field final synthetic val$camera:Landroid/hardware/Camera;

.field final synthetic val$data:[B


# direct methods
.method constructor <init>(Lcom/mbppower/CameraActivity$3;[BLandroid/hardware/Camera;)V
    .locals 0
    .param p1, "this$1"    # Lcom/mbppower/CameraActivity$3;

    .prologue
    .line 334
    iput-object p1, p0, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iput-object p2, p0, Lcom/mbppower/CameraActivity$3$1;->val$data:[B

    iput-object p3, p0, Lcom/mbppower/CameraActivity$3$1;->val$camera:Landroid/hardware/Camera;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .prologue
    const/4 v1, 0x0

    .line 338
    iget-object v2, p0, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iget-object v2, v2, Lcom/mbppower/CameraActivity$3;->this$0:Lcom/mbppower/CameraActivity;

    invoke-static {v2}, Lcom/mbppower/CameraActivity;->access$200(Lcom/mbppower/CameraActivity;)Lcom/mbppower/Preview;

    move-result-object v2

    iget-object v3, p0, Lcom/mbppower/CameraActivity$3$1;->val$data:[B

    iget-object v4, p0, Lcom/mbppower/CameraActivity$3$1;->val$camera:Landroid/hardware/Camera;

    invoke-virtual {v2, v3, v4}, Lcom/mbppower/Preview;->getFramePicture([BLandroid/hardware/Camera;)[B

    move-result-object v12

    .line 339
    .local v12, "bytes":[B
    array-length v2, v12

    invoke-static {v12, v1, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v10

    .line 342
    .local v10, "pic":Landroid/graphics/Bitmap;
    iget-object v2, p0, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iget-object v2, v2, Lcom/mbppower/CameraActivity$3;->val$pictureView:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getWidth()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    int-to-float v3, v3

    div-float v13, v2, v3

    .line 343
    .local v13, "scale":F
    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v13

    float-to-int v2, v2

    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, v13

    float-to-int v3, v3

    invoke-static {v10, v2, v3, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 345
    .local v0, "scaledBitmap":Landroid/graphics/Bitmap;
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 346
    .local v5, "matrix":Landroid/graphics/Matrix;
    iget-object v2, p0, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iget-object v2, v2, Lcom/mbppower/CameraActivity$3;->this$0:Lcom/mbppower/CameraActivity;

    invoke-static {v2}, Lcom/mbppower/CameraActivity;->access$300(Lcom/mbppower/CameraActivity;)I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 347
    const-string v2, "CameraActivity"

    const-string v3, "mirror y axis"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 348
    const/high16 v2, -0x40800000    # -1.0f

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v5, v2, v3}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 350
    :cond_0
    const-string v2, "CameraActivity"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "preRotate "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iget-object v4, v4, Lcom/mbppower/CameraActivity$3;->this$0:Lcom/mbppower/CameraActivity;

    invoke-static {v4}, Lcom/mbppower/CameraActivity;->access$200(Lcom/mbppower/CameraActivity;)Lcom/mbppower/Preview;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mbppower/Preview;->getDisplayOrientation()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "deg"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 351
    iget-object v2, p0, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iget-object v2, v2, Lcom/mbppower/CameraActivity$3;->this$0:Lcom/mbppower/CameraActivity;

    invoke-static {v2}, Lcom/mbppower/CameraActivity;->access$200(Lcom/mbppower/CameraActivity;)Lcom/mbppower/Preview;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mbppower/Preview;->getDisplayOrientation()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v5, v2}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 353
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    move v2, v1

    move v6, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v8

    .line 354
    .local v8, "fixedPic":Landroid/graphics/Bitmap;
    new-instance v9, Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iget-object v1, v1, Lcom/mbppower/CameraActivity$3;->this$0:Lcom/mbppower/CameraActivity;

    invoke-static {v1}, Lcom/mbppower/CameraActivity;->access$200(Lcom/mbppower/CameraActivity;)Lcom/mbppower/Preview;

    move-result-object v1

    iget-object v1, v1, Lcom/mbppower/Preview;->mSurfaceView:Lcom/mbppower/CustomSurfaceView;

    invoke-virtual {v1}, Lcom/mbppower/CustomSurfaceView;->getLeft()I

    move-result v1

    iget-object v2, p0, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iget-object v2, v2, Lcom/mbppower/CameraActivity$3;->this$0:Lcom/mbppower/CameraActivity;

    invoke-static {v2}, Lcom/mbppower/CameraActivity;->access$200(Lcom/mbppower/CameraActivity;)Lcom/mbppower/Preview;

    move-result-object v2

    iget-object v2, v2, Lcom/mbppower/Preview;->mSurfaceView:Lcom/mbppower/CustomSurfaceView;

    invoke-virtual {v2}, Lcom/mbppower/CustomSurfaceView;->getTop()I

    move-result v2

    iget-object v3, p0, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iget-object v3, v3, Lcom/mbppower/CameraActivity$3;->this$0:Lcom/mbppower/CameraActivity;

    invoke-static {v3}, Lcom/mbppower/CameraActivity;->access$200(Lcom/mbppower/CameraActivity;)Lcom/mbppower/Preview;

    move-result-object v3

    iget-object v3, v3, Lcom/mbppower/Preview;->mSurfaceView:Lcom/mbppower/CustomSurfaceView;

    invoke-virtual {v3}, Lcom/mbppower/CustomSurfaceView;->getRight()I

    move-result v3

    iget-object v4, p0, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iget-object v4, v4, Lcom/mbppower/CameraActivity$3;->this$0:Lcom/mbppower/CameraActivity;

    invoke-static {v4}, Lcom/mbppower/CameraActivity;->access$200(Lcom/mbppower/CameraActivity;)Lcom/mbppower/Preview;

    move-result-object v4

    iget-object v4, v4, Lcom/mbppower/Preview;->mSurfaceView:Lcom/mbppower/CustomSurfaceView;

    invoke-virtual {v4}, Lcom/mbppower/CustomSurfaceView;->getBottom()I

    move-result v4

    invoke-direct {v9, v1, v2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 356
    .local v9, "rect":Landroid/graphics/Rect;
    iget-object v1, p0, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iget-object v1, v1, Lcom/mbppower/CameraActivity$3;->this$0:Lcom/mbppower/CameraActivity;

    invoke-virtual {v1}, Lcom/mbppower/CameraActivity;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v6, Lcom/mbppower/CameraActivity$3$1$1;

    move-object v7, p0

    move-object v11, v5

    invoke-direct/range {v6 .. v11}, Lcom/mbppower/CameraActivity$3$1$1;-><init>(Lcom/mbppower/CameraActivity$3$1;Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Bitmap;Landroid/graphics/Matrix;)V

    invoke-virtual {v1, v6}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 385
    return-void
.end method
