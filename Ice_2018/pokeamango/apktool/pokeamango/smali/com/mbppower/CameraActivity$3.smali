.class Lcom/mbppower/CameraActivity$3;
.super Ljava/lang/Object;
.source "CameraActivity.java"

# interfaces
.implements Landroid/hardware/Camera$PreviewCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mbppower/CameraActivity;->takePicture(DD)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mbppower/CameraActivity;

.field final synthetic val$maxHeight:D

.field final synthetic val$maxWidth:D

.field final synthetic val$pictureView:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Lcom/mbppower/CameraActivity;Landroid/widget/ImageView;DD)V
    .locals 1
    .param p1, "this$0"    # Lcom/mbppower/CameraActivity;

    .prologue
    .line 329
    iput-object p1, p0, Lcom/mbppower/CameraActivity$3;->this$0:Lcom/mbppower/CameraActivity;

    iput-object p2, p0, Lcom/mbppower/CameraActivity$3;->val$pictureView:Landroid/widget/ImageView;

    iput-wide p3, p0, Lcom/mbppower/CameraActivity$3;->val$maxWidth:D

    iput-wide p5, p0, Lcom/mbppower/CameraActivity$3;->val$maxHeight:D

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreviewFrame([BLandroid/hardware/Camera;)V
    .locals 1
    .param p1, "data"    # [B
    .param p2, "camera"    # Landroid/hardware/Camera;

    .prologue
    .line 334
    new-instance v0, Lcom/mbppower/CameraActivity$3$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/mbppower/CameraActivity$3$1;-><init>(Lcom/mbppower/CameraActivity$3;[BLandroid/hardware/Camera;)V

    .line 386
    invoke-virtual {v0}, Lcom/mbppower/CameraActivity$3$1;->start()V

    .line 387
    return-void
.end method
