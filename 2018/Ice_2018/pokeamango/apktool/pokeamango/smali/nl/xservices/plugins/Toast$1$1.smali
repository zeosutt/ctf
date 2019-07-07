.class Lnl/xservices/plugins/Toast$1$1;
.super Ljava/lang/Object;
.source "Toast.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnl/xservices/plugins/Toast$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lnl/xservices/plugins/Toast$1;


# direct methods
.method constructor <init>(Lnl/xservices/plugins/Toast$1;)V
    .locals 0
    .param p1, "this$1"    # Lnl/xservices/plugins/Toast$1;

    .prologue
    .line 136
    iput-object p1, p0, Lnl/xservices/plugins/Toast$1$1;->this$1:Lnl/xservices/plugins/Toast$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 15
    .param p1, "view"    # Landroid/view/View;
    .param p2, "motionEvent"    # Landroid/view/MotionEvent;

    .prologue
    .line 139
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v11

    if-eqz v11, :cond_0

    .line 140
    const/4 v11, 0x0

    .line 176
    :goto_0
    return v11

    .line 142
    :cond_0
    iget-object v11, p0, Lnl/xservices/plugins/Toast$1$1;->this$1:Lnl/xservices/plugins/Toast$1;

    iget-object v11, v11, Lnl/xservices/plugins/Toast$1;->this$0:Lnl/xservices/plugins/Toast;

    invoke-static {v11}, Lnl/xservices/plugins/Toast;->access$100(Lnl/xservices/plugins/Toast;)Landroid/widget/Toast;

    move-result-object v11

    if-eqz v11, :cond_1

    iget-object v11, p0, Lnl/xservices/plugins/Toast$1$1;->this$1:Lnl/xservices/plugins/Toast$1;

    iget-object v11, v11, Lnl/xservices/plugins/Toast$1;->this$0:Lnl/xservices/plugins/Toast;

    invoke-static {v11}, Lnl/xservices/plugins/Toast;->access$100(Lnl/xservices/plugins/Toast;)Landroid/widget/Toast;

    move-result-object v11

    invoke-virtual {v11}, Landroid/widget/Toast;->getView()Landroid/view/View;

    move-result-object v11

    invoke-virtual {v11}, Landroid/view/View;->isShown()Z

    move-result v11

    if-nez v11, :cond_2

    .line 143
    :cond_1
    iget-object v11, p0, Lnl/xservices/plugins/Toast$1$1;->this$1:Lnl/xservices/plugins/Toast$1;

    iget-object v11, v11, Lnl/xservices/plugins/Toast$1;->this$0:Lnl/xservices/plugins/Toast;

    invoke-static {v11}, Lnl/xservices/plugins/Toast;->access$200(Lnl/xservices/plugins/Toast;)Landroid/view/ViewGroup;

    move-result-object v11

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Landroid/view/ViewGroup;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 144
    const/4 v11, 0x0

    goto :goto_0

    .line 147
    :cond_2
    iget-object v11, p0, Lnl/xservices/plugins/Toast$1$1;->this$1:Lnl/xservices/plugins/Toast$1;

    iget-object v11, v11, Lnl/xservices/plugins/Toast$1;->this$0:Lnl/xservices/plugins/Toast;

    invoke-static {v11}, Lnl/xservices/plugins/Toast;->access$100(Lnl/xservices/plugins/Toast;)Landroid/widget/Toast;

    move-result-object v11

    invoke-virtual {v11}, Landroid/widget/Toast;->getView()Landroid/view/View;

    move-result-object v11

    invoke-virtual {v11}, Landroid/view/View;->getWidth()I

    move-result v11

    int-to-float v9, v11

    .line 148
    .local v9, "w":F
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getWidth()I

    move-result v11

    div-int/lit8 v11, v11, 0x2

    int-to-float v11, v11

    const/high16 v12, 0x40000000    # 2.0f

    div-float v12, v9, v12

    sub-float v4, v11, v12

    .line 149
    .local v4, "startX":F
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getWidth()I

    move-result v11

    div-int/lit8 v11, v11, 0x2

    int-to-float v11, v11

    const/high16 v12, 0x40000000    # 2.0f

    div-float v12, v9, v12

    add-float v0, v11, v12

    .line 154
    .local v0, "endX":F
    iget-object v11, p0, Lnl/xservices/plugins/Toast$1$1;->this$1:Lnl/xservices/plugins/Toast$1;

    iget-object v11, v11, Lnl/xservices/plugins/Toast$1;->this$0:Lnl/xservices/plugins/Toast;

    invoke-static {v11}, Lnl/xservices/plugins/Toast;->access$100(Lnl/xservices/plugins/Toast;)Landroid/widget/Toast;

    move-result-object v11

    invoke-virtual {v11}, Landroid/widget/Toast;->getGravity()I

    move-result v11

    int-to-float v2, v11

    .line 155
    .local v2, "g":F
    iget-object v11, p0, Lnl/xservices/plugins/Toast$1$1;->this$1:Lnl/xservices/plugins/Toast$1;

    iget-object v11, v11, Lnl/xservices/plugins/Toast$1;->this$0:Lnl/xservices/plugins/Toast;

    invoke-static {v11}, Lnl/xservices/plugins/Toast;->access$100(Lnl/xservices/plugins/Toast;)Landroid/widget/Toast;

    move-result-object v11

    invoke-virtual {v11}, Landroid/widget/Toast;->getYOffset()I

    move-result v11

    int-to-float v10, v11

    .line 156
    .local v10, "y":F
    iget-object v11, p0, Lnl/xservices/plugins/Toast$1$1;->this$1:Lnl/xservices/plugins/Toast$1;

    iget-object v11, v11, Lnl/xservices/plugins/Toast$1;->this$0:Lnl/xservices/plugins/Toast;

    invoke-static {v11}, Lnl/xservices/plugins/Toast;->access$100(Lnl/xservices/plugins/Toast;)Landroid/widget/Toast;

    move-result-object v11

    invoke-virtual {v11}, Landroid/widget/Toast;->getView()Landroid/view/View;

    move-result-object v11

    invoke-virtual {v11}, Landroid/view/View;->getHeight()I

    move-result v11

    int-to-float v3, v11

    .line 158
    .local v3, "h":F
    const/high16 v11, 0x42a20000    # 81.0f

    cmpl-float v11, v2, v11

    if-nez v11, :cond_3

    .line 159
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getHeight()I

    move-result v11

    int-to-float v11, v11

    sub-float/2addr v11, v10

    sub-float v5, v11, v3

    .line 160
    .local v5, "startY":F
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getHeight()I

    move-result v11

    int-to-float v11, v11

    sub-float v1, v11, v10

    .line 170
    .local v1, "endY":F
    :goto_1
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    .line 171
    .local v6, "tapX":F
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    .line 173
    .local v7, "tapY":F
    cmpl-float v11, v6, v4

    if-ltz v11, :cond_5

    cmpg-float v11, v6, v0

    if-gtz v11, :cond_5

    cmpl-float v11, v7, v5

    if-ltz v11, :cond_5

    cmpg-float v11, v7, v1

    if-gtz v11, :cond_5

    const/4 v8, 0x1

    .line 176
    .local v8, "tapped":Z
    :goto_2
    if-eqz v8, :cond_6

    iget-object v11, p0, Lnl/xservices/plugins/Toast$1$1;->this$1:Lnl/xservices/plugins/Toast$1;

    iget-object v11, v11, Lnl/xservices/plugins/Toast$1;->this$0:Lnl/xservices/plugins/Toast;

    iget-object v12, p0, Lnl/xservices/plugins/Toast$1$1;->this$1:Lnl/xservices/plugins/Toast$1;

    iget-object v12, v12, Lnl/xservices/plugins/Toast$1;->val$msg:Ljava/lang/String;

    iget-object v13, p0, Lnl/xservices/plugins/Toast$1$1;->this$1:Lnl/xservices/plugins/Toast$1;

    iget-object v13, v13, Lnl/xservices/plugins/Toast$1;->val$data:Lorg/json/JSONObject;

    iget-object v14, p0, Lnl/xservices/plugins/Toast$1$1;->this$1:Lnl/xservices/plugins/Toast$1;

    iget-object v14, v14, Lnl/xservices/plugins/Toast$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-static {v11, v12, v13, v14}, Lnl/xservices/plugins/Toast;->access$300(Lnl/xservices/plugins/Toast;Ljava/lang/String;Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)Z

    move-result v11

    if-eqz v11, :cond_6

    const/4 v11, 0x1

    goto/16 :goto_0

    .line 161
    .end local v1    # "endY":F
    .end local v5    # "startY":F
    .end local v6    # "tapX":F
    .end local v7    # "tapY":F
    .end local v8    # "tapped":Z
    :cond_3
    const/high16 v11, 0x41880000    # 17.0f

    cmpl-float v11, v2, v11

    if-nez v11, :cond_4

    .line 162
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getHeight()I

    move-result v11

    div-int/lit8 v11, v11, 0x2

    int-to-float v11, v11

    add-float/2addr v11, v10

    const/high16 v12, 0x40000000    # 2.0f

    div-float v12, v3, v12

    sub-float v5, v11, v12

    .line 163
    .restart local v5    # "startY":F
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getHeight()I

    move-result v11

    div-int/lit8 v11, v11, 0x2

    int-to-float v11, v11

    add-float/2addr v11, v10

    const/high16 v12, 0x40000000    # 2.0f

    div-float v12, v3, v12

    add-float v1, v11, v12

    .restart local v1    # "endY":F
    goto :goto_1

    .line 166
    .end local v1    # "endY":F
    .end local v5    # "startY":F
    :cond_4
    move v5, v10

    .line 167
    .restart local v5    # "startY":F
    add-float v1, v10, v3

    .restart local v1    # "endY":F
    goto :goto_1

    .line 173
    .restart local v6    # "tapX":F
    .restart local v7    # "tapY":F
    :cond_5
    const/4 v8, 0x0

    goto :goto_2

    .line 176
    .restart local v8    # "tapped":Z
    :cond_6
    const/4 v11, 0x0

    goto/16 :goto_0
.end method
