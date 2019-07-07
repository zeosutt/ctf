.class Lcom/mbppower/CameraActivity$1$1;
.super Ljava/lang/Object;
.source "CameraActivity.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mbppower/CameraActivity$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mLastTouchX:I

.field private mLastTouchY:I

.field private mPosX:I

.field private mPosY:I

.field final synthetic this$1:Lcom/mbppower/CameraActivity$1;


# direct methods
.method constructor <init>(Lcom/mbppower/CameraActivity$1;)V
    .locals 1
    .param p1, "this$1"    # Lcom/mbppower/CameraActivity$1;

    .prologue
    const/4 v0, 0x0

    .line 123
    iput-object p1, p0, Lcom/mbppower/CameraActivity$1$1;->this$1:Lcom/mbppower/CameraActivity$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    iput v0, p0, Lcom/mbppower/CameraActivity$1$1;->mPosX:I

    .line 128
    iput v0, p0, Lcom/mbppower/CameraActivity$1$1;->mPosY:I

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 11
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v10, 0x1

    const-wide/16 v8, 0x0

    .line 132
    iget-object v6, p0, Lcom/mbppower/CameraActivity$1$1;->this$1:Lcom/mbppower/CameraActivity$1;

    iget-object v6, v6, Lcom/mbppower/CameraActivity$1;->this$0:Lcom/mbppower/CameraActivity;

    iget-object v6, v6, Lcom/mbppower/CameraActivity;->frameContainerLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 135
    .local v3, "layoutParams":Landroid/widget/FrameLayout$LayoutParams;
    iget-object v6, p0, Lcom/mbppower/CameraActivity$1$1;->this$1:Lcom/mbppower/CameraActivity$1;

    iget-object v6, v6, Lcom/mbppower/CameraActivity$1;->val$gestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v6, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    .line 136
    .local v2, "isSingleTapTouch":Z
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    const/4 v7, 0x2

    if-eq v6, v7, :cond_1

    if-eqz v2, :cond_1

    .line 137
    iget-object v6, p0, Lcom/mbppower/CameraActivity$1$1;->this$1:Lcom/mbppower/CameraActivity$1;

    iget-object v6, v6, Lcom/mbppower/CameraActivity$1;->this$0:Lcom/mbppower/CameraActivity;

    iget-boolean v6, v6, Lcom/mbppower/CameraActivity;->tapToTakePicture:Z

    if-eqz v6, :cond_0

    .line 138
    iget-object v6, p0, Lcom/mbppower/CameraActivity$1$1;->this$1:Lcom/mbppower/CameraActivity$1;

    iget-object v6, v6, Lcom/mbppower/CameraActivity$1;->this$0:Lcom/mbppower/CameraActivity;

    invoke-virtual {v6, v8, v9, v8, v9}, Lcom/mbppower/CameraActivity;->takePicture(DD)V

    .line 184
    :cond_0
    :goto_0
    return v10

    .line 143
    :cond_1
    iget-object v6, p0, Lcom/mbppower/CameraActivity$1$1;->this$1:Lcom/mbppower/CameraActivity$1;

    iget-object v6, v6, Lcom/mbppower/CameraActivity$1;->this$0:Lcom/mbppower/CameraActivity;

    iget-boolean v6, v6, Lcom/mbppower/CameraActivity;->dragEnabled:Z

    if-eqz v6, :cond_0

    .line 147
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    packed-switch v6, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 149
    :pswitch_1
    iget v6, p0, Lcom/mbppower/CameraActivity$1$1;->mLastTouchX:I

    if-eqz v6, :cond_2

    iget v6, p0, Lcom/mbppower/CameraActivity$1$1;->mLastTouchY:I

    if-nez v6, :cond_3

    .line 150
    :cond_2
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v6

    float-to-int v6, v6

    iget v7, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    sub-int/2addr v6, v7

    iput v6, p0, Lcom/mbppower/CameraActivity$1$1;->mLastTouchX:I

    .line 151
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v6

    float-to-int v6, v6

    iget v7, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    sub-int/2addr v6, v7

    iput v6, p0, Lcom/mbppower/CameraActivity$1$1;->mLastTouchY:I

    goto :goto_0

    .line 154
    :cond_3
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v6

    float-to-int v6, v6

    iput v6, p0, Lcom/mbppower/CameraActivity$1$1;->mLastTouchX:I

    .line 155
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v6

    float-to-int v6, v6

    iput v6, p0, Lcom/mbppower/CameraActivity$1$1;->mLastTouchY:I

    goto :goto_0

    .line 160
    :pswitch_2
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v6

    float-to-int v4, v6

    .line 161
    .local v4, "x":I
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v6

    float-to-int v5, v6

    .line 163
    .local v5, "y":I
    iget v6, p0, Lcom/mbppower/CameraActivity$1$1;->mLastTouchX:I

    sub-int v6, v4, v6

    int-to-float v0, v6

    .line 164
    .local v0, "dx":F
    iget v6, p0, Lcom/mbppower/CameraActivity$1$1;->mLastTouchY:I

    sub-int v6, v5, v6

    int-to-float v1, v6

    .line 166
    .local v1, "dy":F
    iget v6, p0, Lcom/mbppower/CameraActivity$1$1;->mPosX:I

    int-to-float v6, v6

    add-float/2addr v6, v0

    float-to-int v6, v6

    iput v6, p0, Lcom/mbppower/CameraActivity$1$1;->mPosX:I

    .line 167
    iget v6, p0, Lcom/mbppower/CameraActivity$1$1;->mPosY:I

    int-to-float v6, v6

    add-float/2addr v6, v1

    float-to-int v6, v6

    iput v6, p0, Lcom/mbppower/CameraActivity$1$1;->mPosY:I

    .line 169
    iget v6, p0, Lcom/mbppower/CameraActivity$1$1;->mPosX:I

    iput v6, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 170
    iget v6, p0, Lcom/mbppower/CameraActivity$1$1;->mPosY:I

    iput v6, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 172
    iget-object v6, p0, Lcom/mbppower/CameraActivity$1$1;->this$1:Lcom/mbppower/CameraActivity$1;

    iget-object v6, v6, Lcom/mbppower/CameraActivity$1;->this$0:Lcom/mbppower/CameraActivity;

    iget-object v6, v6, Lcom/mbppower/CameraActivity;->frameContainerLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v6, v3}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 175
    iput v4, p0, Lcom/mbppower/CameraActivity$1$1;->mLastTouchX:I

    .line 176
    iput v5, p0, Lcom/mbppower/CameraActivity$1$1;->mLastTouchY:I

    goto :goto_0

    .line 147
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
