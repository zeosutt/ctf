.class Lcom/mbppower/CameraActivity$1;
.super Ljava/lang/Object;
.source "CameraActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mbppower/CameraActivity;->createCameraPreview()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mbppower/CameraActivity;

.field final synthetic val$gestureDetector:Landroid/view/GestureDetector;


# direct methods
.method constructor <init>(Lcom/mbppower/CameraActivity;Landroid/view/GestureDetector;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mbppower/CameraActivity;

    .prologue
    .line 119
    iput-object p1, p0, Lcom/mbppower/CameraActivity$1;->this$0:Lcom/mbppower/CameraActivity;

    iput-object p2, p0, Lcom/mbppower/CameraActivity$1;->val$gestureDetector:Landroid/view/GestureDetector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 122
    iget-object v0, p0, Lcom/mbppower/CameraActivity$1;->this$0:Lcom/mbppower/CameraActivity;

    iget-object v0, v0, Lcom/mbppower/CameraActivity;->frameContainerLayout:Landroid/widget/FrameLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setClickable(Z)V

    .line 123
    iget-object v0, p0, Lcom/mbppower/CameraActivity$1;->this$0:Lcom/mbppower/CameraActivity;

    iget-object v0, v0, Lcom/mbppower/CameraActivity;->frameContainerLayout:Landroid/widget/FrameLayout;

    new-instance v1, Lcom/mbppower/CameraActivity$1$1;

    invoke-direct {v1, p0}, Lcom/mbppower/CameraActivity$1$1;-><init>(Lcom/mbppower/CameraActivity$1;)V

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 187
    return-void
.end method
