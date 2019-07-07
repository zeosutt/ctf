.class Lcom/mbppower/CameraActivity$4;
.super Ljava/lang/Thread;
.source "CameraActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mbppower/CameraActivity;->generatePictureFromView(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mbppower/CameraActivity;

.field final synthetic val$cameraLoader:Landroid/widget/FrameLayout;

.field final synthetic val$originalPicture:Landroid/graphics/Bitmap;

.field final synthetic val$picture:Landroid/graphics/Bitmap;

.field final synthetic val$pictureView:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Lcom/mbppower/CameraActivity;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/widget/FrameLayout;Landroid/widget/ImageView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mbppower/CameraActivity;

    .prologue
    .line 399
    iput-object p1, p0, Lcom/mbppower/CameraActivity$4;->this$0:Lcom/mbppower/CameraActivity;

    iput-object p2, p0, Lcom/mbppower/CameraActivity$4;->val$picture:Landroid/graphics/Bitmap;

    iput-object p3, p0, Lcom/mbppower/CameraActivity$4;->val$originalPicture:Landroid/graphics/Bitmap;

    iput-object p4, p0, Lcom/mbppower/CameraActivity$4;->val$cameraLoader:Landroid/widget/FrameLayout;

    iput-object p5, p0, Lcom/mbppower/CameraActivity$4;->val$pictureView:Landroid/widget/ImageView;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 403
    :try_start_0
    iget-object v3, p0, Lcom/mbppower/CameraActivity$4;->this$0:Lcom/mbppower/CameraActivity;

    iget-object v4, p0, Lcom/mbppower/CameraActivity$4;->val$picture:Landroid/graphics/Bitmap;

    const-string v5, "_preview"

    invoke-static {v3, v4, v5}, Lcom/mbppower/CameraActivity;->access$700(Lcom/mbppower/CameraActivity;Landroid/graphics/Bitmap;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 404
    .local v2, "picFile":Ljava/io/File;
    iget-object v3, p0, Lcom/mbppower/CameraActivity$4;->this$0:Lcom/mbppower/CameraActivity;

    iget-object v4, p0, Lcom/mbppower/CameraActivity$4;->val$originalPicture:Landroid/graphics/Bitmap;

    const-string v5, "_original"

    invoke-static {v3, v4, v5}, Lcom/mbppower/CameraActivity;->access$700(Lcom/mbppower/CameraActivity;Landroid/graphics/Bitmap;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 406
    .local v1, "originalPictureFile":Ljava/io/File;
    iget-object v3, p0, Lcom/mbppower/CameraActivity$4;->this$0:Lcom/mbppower/CameraActivity;

    invoke-static {v3}, Lcom/mbppower/CameraActivity;->access$800(Lcom/mbppower/CameraActivity;)Lcom/mbppower/CameraActivity$CameraPreviewListener;

    move-result-object v3

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lcom/mbppower/CameraActivity$CameraPreviewListener;->onPictureTaken(Ljava/lang/String;Ljava/lang/String;)V

    .line 408
    iget-object v3, p0, Lcom/mbppower/CameraActivity$4;->this$0:Lcom/mbppower/CameraActivity;

    invoke-virtual {v3}, Lcom/mbppower/CameraActivity;->getActivity()Landroid/app/Activity;

    move-result-object v3

    new-instance v4, Lcom/mbppower/CameraActivity$4$1;

    invoke-direct {v4, p0}, Lcom/mbppower/CameraActivity$4$1;-><init>(Lcom/mbppower/CameraActivity$4;)V

    invoke-virtual {v3, v4}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 426
    .end local v1    # "originalPictureFile":Ljava/io/File;
    .end local v2    # "picFile":Ljava/io/File;
    :goto_0
    return-void

    .line 416
    :catch_0
    move-exception v0

    .line 418
    .local v0, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/mbppower/CameraActivity$4;->this$0:Lcom/mbppower/CameraActivity;

    invoke-virtual {v3}, Lcom/mbppower/CameraActivity;->getActivity()Landroid/app/Activity;

    move-result-object v3

    new-instance v4, Lcom/mbppower/CameraActivity$4$2;

    invoke-direct {v4, p0}, Lcom/mbppower/CameraActivity$4$2;-><init>(Lcom/mbppower/CameraActivity$4;)V

    invoke-virtual {v3, v4}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method
