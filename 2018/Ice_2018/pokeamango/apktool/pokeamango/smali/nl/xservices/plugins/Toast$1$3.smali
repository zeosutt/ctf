.class Lnl/xservices/plugins/Toast$1$3;
.super Landroid/os/CountDownTimer;
.source "Toast.java"


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

.field final synthetic val$toast:Landroid/widget/Toast;


# direct methods
.method constructor <init>(Lnl/xservices/plugins/Toast$1;JJLandroid/widget/Toast;)V
    .locals 0
    .param p1, "this$1"    # Lnl/xservices/plugins/Toast$1;
    .param p2, "x0"    # J
    .param p4, "x1"    # J

    .prologue
    .line 189
    iput-object p1, p0, Lnl/xservices/plugins/Toast$1$3;->this$1:Lnl/xservices/plugins/Toast$1;

    iput-object p6, p0, Lnl/xservices/plugins/Toast$1$3;->val$toast:Landroid/widget/Toast;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 1

    .prologue
    .line 191
    iget-object v0, p0, Lnl/xservices/plugins/Toast$1$3;->val$toast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    return-void
.end method

.method public onTick(J)V
    .locals 1
    .param p1, "millisUntilFinished"    # J

    .prologue
    .line 190
    iget-object v0, p0, Lnl/xservices/plugins/Toast$1$3;->val$toast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method
