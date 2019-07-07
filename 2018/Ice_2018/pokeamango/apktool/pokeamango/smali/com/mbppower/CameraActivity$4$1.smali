.class Lcom/mbppower/CameraActivity$4$1;
.super Ljava/lang/Object;
.source "CameraActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mbppower/CameraActivity$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mbppower/CameraActivity$4;


# direct methods
.method constructor <init>(Lcom/mbppower/CameraActivity$4;)V
    .locals 0
    .param p1, "this$1"    # Lcom/mbppower/CameraActivity$4;

    .prologue
    .line 408
    iput-object p1, p0, Lcom/mbppower/CameraActivity$4$1;->this$1:Lcom/mbppower/CameraActivity$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 411
    iget-object v0, p0, Lcom/mbppower/CameraActivity$4$1;->this$1:Lcom/mbppower/CameraActivity$4;

    iget-object v0, v0, Lcom/mbppower/CameraActivity$4;->val$cameraLoader:Landroid/widget/FrameLayout;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 412
    iget-object v0, p0, Lcom/mbppower/CameraActivity$4$1;->this$1:Lcom/mbppower/CameraActivity$4;

    iget-object v0, v0, Lcom/mbppower/CameraActivity$4;->val$pictureView:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 413
    return-void
.end method
