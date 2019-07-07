.class Lnl/xservices/plugins/Toast$1$2;
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
    .line 180
    iput-object p1, p0, Lnl/xservices/plugins/Toast$1$2;->this$1:Lnl/xservices/plugins/Toast$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "motionEvent"    # Landroid/view/MotionEvent;

    .prologue
    .line 183
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lnl/xservices/plugins/Toast$1$2;->this$1:Lnl/xservices/plugins/Toast$1;

    iget-object v0, v0, Lnl/xservices/plugins/Toast$1;->this$0:Lnl/xservices/plugins/Toast;

    iget-object v1, p0, Lnl/xservices/plugins/Toast$1$2;->this$1:Lnl/xservices/plugins/Toast$1;

    iget-object v1, v1, Lnl/xservices/plugins/Toast$1;->val$msg:Ljava/lang/String;

    iget-object v2, p0, Lnl/xservices/plugins/Toast$1$2;->this$1:Lnl/xservices/plugins/Toast$1;

    iget-object v2, v2, Lnl/xservices/plugins/Toast$1;->val$data:Lorg/json/JSONObject;

    iget-object v3, p0, Lnl/xservices/plugins/Toast$1$2;->this$1:Lnl/xservices/plugins/Toast$1;

    iget-object v3, v3, Lnl/xservices/plugins/Toast$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-static {v0, v1, v2, v3}, Lnl/xservices/plugins/Toast;->access$300(Lnl/xservices/plugins/Toast;Ljava/lang/String;Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
