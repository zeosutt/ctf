.class Lcom/mbppower/CameraActivity$3$1$1;
.super Ljava/lang/Object;
.source "CameraActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mbppower/CameraActivity$3$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/mbppower/CameraActivity$3$1;

.field final synthetic val$fixedPic:Landroid/graphics/Bitmap;

.field final synthetic val$matrix:Landroid/graphics/Matrix;

.field final synthetic val$pic:Landroid/graphics/Bitmap;

.field final synthetic val$rect:Landroid/graphics/Rect;


# direct methods
.method constructor <init>(Lcom/mbppower/CameraActivity$3$1;Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Bitmap;Landroid/graphics/Matrix;)V
    .locals 0
    .param p1, "this$2"    # Lcom/mbppower/CameraActivity$3$1;

    .prologue
    .line 356
    iput-object p1, p0, Lcom/mbppower/CameraActivity$3$1$1;->this$2:Lcom/mbppower/CameraActivity$3$1;

    iput-object p2, p0, Lcom/mbppower/CameraActivity$3$1$1;->val$fixedPic:Landroid/graphics/Bitmap;

    iput-object p3, p0, Lcom/mbppower/CameraActivity$3$1$1;->val$rect:Landroid/graphics/Rect;

    iput-object p4, p0, Lcom/mbppower/CameraActivity$3$1$1;->val$pic:Landroid/graphics/Bitmap;

    iput-object p5, p0, Lcom/mbppower/CameraActivity$3$1$1;->val$matrix:Landroid/graphics/Matrix;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 18

    .prologue
    .line 359
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mbppower/CameraActivity$3$1$1;->this$2:Lcom/mbppower/CameraActivity$3$1;

    iget-object v3, v3, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iget-object v3, v3, Lcom/mbppower/CameraActivity$3;->val$pictureView:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mbppower/CameraActivity$3$1$1;->val$fixedPic:Landroid/graphics/Bitmap;

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 360
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mbppower/CameraActivity$3$1$1;->this$2:Lcom/mbppower/CameraActivity$3$1;

    iget-object v3, v3, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iget-object v3, v3, Lcom/mbppower/CameraActivity$3;->val$pictureView:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mbppower/CameraActivity$3$1$1;->val$rect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mbppower/CameraActivity$3$1$1;->val$rect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/mbppower/CameraActivity$3$1$1;->val$rect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->right:I

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/mbppower/CameraActivity$3$1$1;->val$rect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/widget/ImageView;->layout(IIII)V

    .line 362
    const/4 v2, 0x0

    .line 364
    .local v2, "finalPic":Landroid/graphics/Bitmap;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mbppower/CameraActivity$3$1$1;->this$2:Lcom/mbppower/CameraActivity$3$1;

    iget-object v3, v3, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iget-wide v4, v3, Lcom/mbppower/CameraActivity$3;->val$maxWidth:D

    const-wide/16 v6, 0x0

    cmpl-double v3, v4, v6

    if-lez v3, :cond_1

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mbppower/CameraActivity$3$1$1;->this$2:Lcom/mbppower/CameraActivity$3$1;

    iget-object v3, v3, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iget-wide v4, v3, Lcom/mbppower/CameraActivity$3;->val$maxHeight:D

    const-wide/16 v6, 0x0

    cmpl-double v3, v4, v6

    if-lez v3, :cond_1

    .line 365
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mbppower/CameraActivity$3$1$1;->this$2:Lcom/mbppower/CameraActivity$3$1;

    iget-object v3, v3, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iget-wide v4, v3, Lcom/mbppower/CameraActivity$3;->val$maxWidth:D

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mbppower/CameraActivity$3$1$1;->val$pic:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-double v6, v3

    div-double v14, v4, v6

    .line 366
    .local v14, "scaleHeight":D
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mbppower/CameraActivity$3$1$1;->this$2:Lcom/mbppower/CameraActivity$3$1;

    iget-object v3, v3, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iget-wide v4, v3, Lcom/mbppower/CameraActivity$3;->val$maxHeight:D

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mbppower/CameraActivity$3$1$1;->val$pic:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    int-to-double v6, v3

    div-double v16, v4, v6

    .line 367
    .local v16, "scaleWidth":D
    cmpg-double v3, v14, v16

    if-gez v3, :cond_0

    move-wide/from16 v12, v16

    .line 368
    .local v12, "scale":D
    :goto_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mbppower/CameraActivity$3$1$1;->val$pic:Landroid/graphics/Bitmap;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mbppower/CameraActivity$3$1$1;->val$pic:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    int-to-double v4, v4

    mul-double/2addr v4, v12

    double-to-int v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mbppower/CameraActivity$3$1$1;->val$pic:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-double v6, v5

    mul-double/2addr v6, v12

    double-to-int v5, v6

    const/4 v6, 0x0

    invoke-static {v3, v4, v5, v6}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 374
    .end local v12    # "scale":D
    .end local v14    # "scaleHeight":D
    .end local v16    # "scaleWidth":D
    :goto_1
    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/mbppower/CameraActivity$3$1$1;->val$matrix:Landroid/graphics/Matrix;

    const/4 v8, 0x0

    invoke-static/range {v2 .. v8}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v9

    .line 377
    .local v9, "originalPicture":Landroid/graphics/Bitmap;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mbppower/CameraActivity$3$1$1;->this$2:Lcom/mbppower/CameraActivity$3$1;

    iget-object v3, v3, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iget-object v3, v3, Lcom/mbppower/CameraActivity$3;->this$0:Lcom/mbppower/CameraActivity;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mbppower/CameraActivity$3$1$1;->this$2:Lcom/mbppower/CameraActivity$3$1;

    iget-object v4, v4, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iget-object v4, v4, Lcom/mbppower/CameraActivity$3;->this$0:Lcom/mbppower/CameraActivity;

    invoke-static {v4}, Lcom/mbppower/CameraActivity;->access$100(Lcom/mbppower/CameraActivity;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mbppower/CameraActivity$3$1$1;->this$2:Lcom/mbppower/CameraActivity$3$1;

    iget-object v5, v5, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iget-object v5, v5, Lcom/mbppower/CameraActivity$3;->this$0:Lcom/mbppower/CameraActivity;

    invoke-virtual {v5}, Lcom/mbppower/CameraActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const-string v6, "frame_camera_cont"

    const-string v7, "id"

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/mbppower/CameraActivity$3$1$1;->this$2:Lcom/mbppower/CameraActivity$3$1;

    iget-object v8, v8, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iget-object v8, v8, Lcom/mbppower/CameraActivity$3;->this$0:Lcom/mbppower/CameraActivity;

    invoke-static {v8}, Lcom/mbppower/CameraActivity;->access$000(Lcom/mbppower/CameraActivity;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v6, v7, v8}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mbppower/CameraActivity;->access$400(Lcom/mbppower/CameraActivity;Landroid/view/View;)Landroid/graphics/Bitmap;

    move-result-object v10

    .line 378
    .local v10, "picture":Landroid/graphics/Bitmap;
    new-instance v11, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v11}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 379
    .local v11, "stream":Ljava/io/ByteArrayOutputStream;
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x50

    invoke-virtual {v10, v3, v4, v11}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 381
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mbppower/CameraActivity$3$1$1;->this$2:Lcom/mbppower/CameraActivity$3$1;

    iget-object v3, v3, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iget-object v3, v3, Lcom/mbppower/CameraActivity$3;->this$0:Lcom/mbppower/CameraActivity;

    invoke-static {v3, v9, v10}, Lcom/mbppower/CameraActivity;->access$500(Lcom/mbppower/CameraActivity;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 382
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mbppower/CameraActivity$3$1$1;->this$2:Lcom/mbppower/CameraActivity$3$1;

    iget-object v3, v3, Lcom/mbppower/CameraActivity$3$1;->this$1:Lcom/mbppower/CameraActivity$3;

    iget-object v3, v3, Lcom/mbppower/CameraActivity$3;->this$0:Lcom/mbppower/CameraActivity;

    const/4 v4, 0x1

    invoke-static {v3, v4}, Lcom/mbppower/CameraActivity;->access$602(Lcom/mbppower/CameraActivity;Z)Z

    .line 383
    return-void

    .end local v9    # "originalPicture":Landroid/graphics/Bitmap;
    .end local v10    # "picture":Landroid/graphics/Bitmap;
    .end local v11    # "stream":Ljava/io/ByteArrayOutputStream;
    .restart local v14    # "scaleHeight":D
    .restart local v16    # "scaleWidth":D
    :cond_0
    move-wide v12, v14

    .line 367
    goto/16 :goto_0

    .line 371
    .end local v14    # "scaleHeight":D
    .end local v16    # "scaleWidth":D
    :cond_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mbppower/CameraActivity$3$1$1;->val$pic:Landroid/graphics/Bitmap;

    goto :goto_1
.end method
