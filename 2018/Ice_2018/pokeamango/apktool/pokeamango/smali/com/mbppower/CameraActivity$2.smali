.class Lcom/mbppower/CameraActivity$2;
.super Ljava/lang/Object;
.source "CameraActivity.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mbppower/CameraActivity;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mbppower/CameraActivity;

.field final synthetic val$frameContainerLayout:Landroid/widget/FrameLayout;


# direct methods
.method constructor <init>(Lcom/mbppower/CameraActivity;Landroid/widget/FrameLayout;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mbppower/CameraActivity;

    .prologue
    .line 234
    iput-object p1, p0, Lcom/mbppower/CameraActivity$2;->this$0:Lcom/mbppower/CameraActivity;

    iput-object p2, p0, Lcom/mbppower/CameraActivity$2;->val$frameContainerLayout:Landroid/widget/FrameLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 237
    iget-object v2, p0, Lcom/mbppower/CameraActivity$2;->val$frameContainerLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    invoke-virtual {v2, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 238
    iget-object v2, p0, Lcom/mbppower/CameraActivity$2;->val$frameContainerLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v3, v3}, Landroid/widget/FrameLayout;->measure(II)V

    .line 239
    iget-object v2, p0, Lcom/mbppower/CameraActivity$2;->this$0:Lcom/mbppower/CameraActivity;

    invoke-static {v2}, Lcom/mbppower/CameraActivity;->access$100(Lcom/mbppower/CameraActivity;)Landroid/view/View;

    move-result-object v2

    iget-object v3, p0, Lcom/mbppower/CameraActivity$2;->this$0:Lcom/mbppower/CameraActivity;

    invoke-virtual {v3}, Lcom/mbppower/CameraActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "frame_camera_cont"

    const-string v5, "id"

    iget-object v6, p0, Lcom/mbppower/CameraActivity$2;->this$0:Lcom/mbppower/CameraActivity;

    invoke-static {v6}, Lcom/mbppower/CameraActivity;->access$000(Lcom/mbppower/CameraActivity;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    .line 241
    .local v1, "frameCamContainerLayout":Landroid/widget/RelativeLayout;
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    iget-object v2, p0, Lcom/mbppower/CameraActivity$2;->val$frameContainerLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/mbppower/CameraActivity$2;->val$frameContainerLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v3

    invoke-direct {v0, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 242
    .local v0, "camViewLayout":Landroid/widget/FrameLayout$LayoutParams;
    const/16 v2, 0x11

    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 243
    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 244
    return-void
.end method
