.class public Lnl/xservices/plugins/Toast;
.super Lorg/apache/cordova/CordovaPlugin;
.source "Toast.java"


# static fields
.field private static final ACTION_HIDE_EVENT:Ljava/lang/String; = "hide"

.field private static final ACTION_SHOW_EVENT:Ljava/lang/String; = "show"

.field private static final BASE_TOP_BOTTOM_OFFSET:I = 0x14

.field private static final GRAVITY_BOTTOM:I = 0x51

.field private static final GRAVITY_CENTER:I = 0x11

.field private static final GRAVITY_TOP:I = 0x31

.field private static final IS_AT_LEAST_LOLLIPOP:Z

.field private static _timer:Landroid/os/CountDownTimer;


# instance fields
.field private isPaused:Z

.field private mostRecentToast:Landroid/widget/Toast;

.field private viewGroup:Landroid/view/ViewGroup;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 38
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lnl/xservices/plugins/Toast;->IS_AT_LEAST_LOLLIPOP:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    .prologue
    .line 24
    sget-boolean v0, Lnl/xservices/plugins/Toast;->IS_AT_LEAST_LOLLIPOP:Z

    return v0
.end method

.method static synthetic access$100(Lnl/xservices/plugins/Toast;)Landroid/widget/Toast;
    .locals 1
    .param p0, "x0"    # Lnl/xservices/plugins/Toast;

    .prologue
    .line 24
    iget-object v0, p0, Lnl/xservices/plugins/Toast;->mostRecentToast:Landroid/widget/Toast;

    return-object v0
.end method

.method static synthetic access$102(Lnl/xservices/plugins/Toast;Landroid/widget/Toast;)Landroid/widget/Toast;
    .locals 0
    .param p0, "x0"    # Lnl/xservices/plugins/Toast;
    .param p1, "x1"    # Landroid/widget/Toast;

    .prologue
    .line 24
    iput-object p1, p0, Lnl/xservices/plugins/Toast;->mostRecentToast:Landroid/widget/Toast;

    return-object p1
.end method

.method static synthetic access$200(Lnl/xservices/plugins/Toast;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lnl/xservices/plugins/Toast;

    .prologue
    .line 24
    invoke-direct {p0}, Lnl/xservices/plugins/Toast;->getViewGroup()Landroid/view/ViewGroup;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lnl/xservices/plugins/Toast;Ljava/lang/String;Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)Z
    .locals 1
    .param p0, "x0"    # Lnl/xservices/plugins/Toast;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Lorg/json/JSONObject;
    .param p3, "x3"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 24
    invoke-direct {p0, p1, p2, p3}, Lnl/xservices/plugins/Toast;->returnTapEvent(Ljava/lang/String;Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$402(Landroid/os/CountDownTimer;)Landroid/os/CountDownTimer;
    .locals 0
    .param p0, "x0"    # Landroid/os/CountDownTimer;

    .prologue
    .line 24
    sput-object p0, Lnl/xservices/plugins/Toast;->_timer:Landroid/os/CountDownTimer;

    return-object p0
.end method

.method private getViewGroup()Landroid/view/ViewGroup;
    .locals 2

    .prologue
    .line 236
    iget-object v0, p0, Lnl/xservices/plugins/Toast;->viewGroup:Landroid/view/ViewGroup;

    if-nez v0, :cond_0

    .line 237
    iget-object v0, p0, Lnl/xservices/plugins/Toast;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x1020002

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lnl/xservices/plugins/Toast;->viewGroup:Landroid/view/ViewGroup;

    .line 239
    :cond_0
    iget-object v0, p0, Lnl/xservices/plugins/Toast;->viewGroup:Landroid/view/ViewGroup;

    return-object v0
.end method

.method private hide()V
    .locals 2

    .prologue
    .line 211
    iget-object v0, p0, Lnl/xservices/plugins/Toast;->mostRecentToast:Landroid/widget/Toast;

    if-eqz v0, :cond_0

    .line 212
    iget-object v0, p0, Lnl/xservices/plugins/Toast;->mostRecentToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    .line 213
    invoke-direct {p0}, Lnl/xservices/plugins/Toast;->getViewGroup()Landroid/view/ViewGroup;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 215
    :cond_0
    sget-object v0, Lnl/xservices/plugins/Toast;->_timer:Landroid/os/CountDownTimer;

    if-eqz v0, :cond_1

    .line 216
    sget-object v0, Lnl/xservices/plugins/Toast;->_timer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 218
    :cond_1
    return-void
.end method

.method private returnTapEvent(Ljava/lang/String;Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)Z
    .locals 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "data"    # Lorg/json/JSONObject;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 221
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 223
    .local v1, "json":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "event"

    const-string v3, "touch"

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 224
    const-string v2, "message"

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 225
    const-string v2, "data"

    invoke-virtual {v1, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 229
    :goto_0
    invoke-virtual {p3, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 230
    invoke-direct {p0}, Lnl/xservices/plugins/Toast;->hide()V

    .line 231
    const/4 v2, 0x1

    return v2

    .line 226
    :catch_0
    move-exception v0

    .line 227
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 12
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 47
    const-string v0, "hide"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 48
    invoke-direct {p0}, Lnl/xservices/plugins/Toast;->hide()V

    .line 49
    invoke-virtual {p3}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 50
    const/4 v0, 0x1

    .line 206
    :goto_0
    return v0

    .line 52
    :cond_0
    const-string v0, "show"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 53
    iget-boolean v0, p0, Lnl/xservices/plugins/Toast;->isPaused:Z

    if-eqz v0, :cond_1

    .line 54
    const/4 v0, 0x1

    goto :goto_0

    .line 57
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v10

    .line 58
    .local v10, "options":Lorg/json/JSONObject;
    const-string v0, "message"

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 59
    .local v8, "msg":Ljava/lang/String;
    new-instance v3, Landroid/text/SpannableString;

    invoke-direct {v3, v8}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 60
    .local v3, "message":Landroid/text/Spannable;
    new-instance v0, Landroid/text/style/AlignmentSpan$Standard;

    sget-object v1, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    invoke-direct {v0, v1}, Landroid/text/style/AlignmentSpan$Standard;-><init>(Landroid/text/Layout$Alignment;)V

    const/4 v1, 0x0

    .line 63
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    const/16 v11, 0x12

    .line 60
    invoke-interface {v3, v0, v1, v6, v11}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 66
    const-string v0, "duration"

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 67
    .local v2, "duration":Ljava/lang/String;
    const-string v0, "position"

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 68
    .local v4, "position":Ljava/lang/String;
    const-string v0, "addPixelsY"

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "addPixelsY"

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    .line 69
    .local v5, "addPixelsY":I
    :goto_1
    const-string v0, "data"

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "data"

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    .line 70
    .local v9, "data":Lorg/json/JSONObject;
    :goto_2
    const-string v0, "styling"

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    .line 72
    .local v7, "styling":Lorg/json/JSONObject;
    iget-object v0, p0, Lnl/xservices/plugins/Toast;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v11

    new-instance v0, Lnl/xservices/plugins/Toast$1;

    move-object v1, p0

    move-object v6, p3

    invoke-direct/range {v0 .. v9}, Lnl/xservices/plugins/Toast$1;-><init>(Lnl/xservices/plugins/Toast;Ljava/lang/String;Landroid/text/Spannable;Ljava/lang/String;ILorg/apache/cordova/CallbackContext;Lorg/json/JSONObject;Ljava/lang/String;Lorg/json/JSONObject;)V

    invoke-virtual {v11, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 203
    const/4 v0, 0x1

    goto :goto_0

    .line 68
    .end local v5    # "addPixelsY":I
    .end local v7    # "styling":Lorg/json/JSONObject;
    .end local v9    # "data":Lorg/json/JSONObject;
    :cond_2
    const/4 v5, 0x0

    goto :goto_1

    .line 69
    .restart local v5    # "addPixelsY":I
    :cond_3
    const/4 v9, 0x0

    goto :goto_2

    .line 205
    .end local v2    # "duration":Ljava/lang/String;
    .end local v3    # "message":Landroid/text/Spannable;
    .end local v4    # "position":Ljava/lang/String;
    .end local v5    # "addPixelsY":I
    .end local v8    # "msg":Ljava/lang/String;
    .end local v10    # "options":Lorg/json/JSONObject;
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "toast."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " is not a supported function. Did you mean \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "show"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 206
    const/4 v0, 0x0

    goto/16 :goto_0
.end method

.method public onPause(Z)V
    .locals 1
    .param p1, "multitasking"    # Z

    .prologue
    .line 244
    invoke-direct {p0}, Lnl/xservices/plugins/Toast;->hide()V

    .line 245
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnl/xservices/plugins/Toast;->isPaused:Z

    .line 246
    return-void
.end method

.method public onResume(Z)V
    .locals 1
    .param p1, "multitasking"    # Z

    .prologue
    .line 250
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnl/xservices/plugins/Toast;->isPaused:Z

    .line 251
    return-void
.end method
