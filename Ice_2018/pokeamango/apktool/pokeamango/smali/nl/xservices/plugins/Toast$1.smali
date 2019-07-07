.class Lnl/xservices/plugins/Toast$1;
.super Ljava/lang/Object;
.source "Toast.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnl/xservices/plugins/Toast;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lnl/xservices/plugins/Toast;

.field final synthetic val$addPixelsY:I

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;

.field final synthetic val$data:Lorg/json/JSONObject;

.field final synthetic val$duration:Ljava/lang/String;

.field final synthetic val$message:Landroid/text/Spannable;

.field final synthetic val$msg:Ljava/lang/String;

.field final synthetic val$position:Ljava/lang/String;

.field final synthetic val$styling:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lnl/xservices/plugins/Toast;Ljava/lang/String;Landroid/text/Spannable;Ljava/lang/String;ILorg/apache/cordova/CallbackContext;Lorg/json/JSONObject;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "this$0"    # Lnl/xservices/plugins/Toast;

    .prologue
    .line 72
    iput-object p1, p0, Lnl/xservices/plugins/Toast$1;->this$0:Lnl/xservices/plugins/Toast;

    iput-object p2, p0, Lnl/xservices/plugins/Toast$1;->val$duration:Ljava/lang/String;

    iput-object p3, p0, Lnl/xservices/plugins/Toast$1;->val$message:Landroid/text/Spannable;

    iput-object p4, p0, Lnl/xservices/plugins/Toast$1;->val$position:Ljava/lang/String;

    iput p5, p0, Lnl/xservices/plugins/Toast$1;->val$addPixelsY:I

    iput-object p6, p0, Lnl/xservices/plugins/Toast$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    iput-object p7, p0, Lnl/xservices/plugins/Toast$1;->val$styling:Lorg/json/JSONObject;

    iput-object p8, p0, Lnl/xservices/plugins/Toast$1;->val$msg:Ljava/lang/String;

    iput-object p9, p0, Lnl/xservices/plugins/Toast$1;->val$data:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 21

    .prologue
    .line 75
    const-string v2, "short"

    move-object/from16 v0, p0

    iget-object v3, v0, Lnl/xservices/plugins/Toast$1;->val$duration:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 76
    const/16 v11, 0x7d0

    .line 84
    .local v11, "hideAfterMs":I
    :goto_0
    invoke-static {}, Lnl/xservices/plugins/Toast;->access$000()Z

    move-result v2

    if-eqz v2, :cond_4

    move-object/from16 v0, p0

    iget-object v2, v0, Lnl/xservices/plugins/Toast$1;->this$0:Lnl/xservices/plugins/Toast;

    iget-object v2, v2, Lnl/xservices/plugins/Toast;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getContext()Landroid/content/Context;

    move-result-object v2

    :goto_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lnl/xservices/plugins/Toast$1;->val$message:Landroid/text/Spannable;

    const/4 v4, 0x1

    .line 83
    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v8

    .line 89
    .local v8, "toast":Landroid/widget/Toast;
    const-string v2, "top"

    move-object/from16 v0, p0

    iget-object v3, v0, Lnl/xservices/plugins/Toast$1;->val$position:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 90
    const/16 v2, 0x31

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget v4, v0, Lnl/xservices/plugins/Toast$1;->val$addPixelsY:I

    add-int/lit8 v4, v4, 0x14

    invoke-virtual {v8, v2, v3, v4}, Landroid/widget/Toast;->setGravity(III)V

    .line 101
    :goto_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lnl/xservices/plugins/Toast$1;->val$styling:Lorg/json/JSONObject;

    if-eqz v2, :cond_1

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-lt v2, v3, :cond_1

    .line 104
    move-object/from16 v0, p0

    iget-object v2, v0, Lnl/xservices/plugins/Toast$1;->val$styling:Lorg/json/JSONObject;

    const-string v3, "backgroundColor"

    const-string v4, "#333333"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 105
    .local v9, "backgroundColor":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lnl/xservices/plugins/Toast$1;->val$styling:Lorg/json/JSONObject;

    const-string v3, "textColor"

    const-string v4, "#ffffff"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 106
    .local v17, "textColor":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lnl/xservices/plugins/Toast$1;->val$styling:Lorg/json/JSONObject;

    const-string v3, "textSize"

    const-wide/high16 v4, -0x4010000000000000L    # -1.0

    invoke-virtual {v2, v3, v4, v5}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v18

    .line 107
    .local v18, "textSize":Ljava/lang/Double;
    move-object/from16 v0, p0

    iget-object v2, v0, Lnl/xservices/plugins/Toast$1;->val$styling:Lorg/json/JSONObject;

    const-string v3, "opacity"

    const-wide v4, 0x3fe999999999999aL    # 0.8

    invoke-virtual {v2, v3, v4, v5}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v14

    .line 108
    .local v14, "opacity":D
    move-object/from16 v0, p0

    iget-object v2, v0, Lnl/xservices/plugins/Toast$1;->val$styling:Lorg/json/JSONObject;

    const-string v3, "cornerRadius"

    const/16 v4, 0x64

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v10

    .line 109
    .local v10, "cornerRadius":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lnl/xservices/plugins/Toast$1;->val$styling:Lorg/json/JSONObject;

    const-string v3, "horizontalPadding"

    const/16 v4, 0x32

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v12

    .line 110
    .local v12, "horizontalPadding":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lnl/xservices/plugins/Toast$1;->val$styling:Lorg/json/JSONObject;

    const-string v3, "verticalPadding"

    const/16 v4, 0x1e

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v20

    .line 112
    .local v20, "verticalPadding":I
    new-instance v16, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct/range {v16 .. v16}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 113
    .local v16, "shape":Landroid/graphics/drawable/GradientDrawable;
    int-to-float v2, v10

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 114
    const-wide v2, 0x406fe00000000000L    # 255.0

    mul-double/2addr v2, v14

    double-to-int v2, v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setAlpha(I)V

    .line 115
    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 116
    invoke-virtual {v8}, Landroid/widget/Toast;->getView()Landroid/view/View;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 119
    invoke-virtual {v8}, Landroid/widget/Toast;->getView()Landroid/view/View;

    move-result-object v2

    const v3, 0x102000b

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v19

    check-cast v19, Landroid/widget/TextView;

    .line 120
    .local v19, "toastTextView":Landroid/widget/TextView;
    invoke-static/range {v17 .. v17}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 121
    invoke-virtual/range {v18 .. v18}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    const-wide/high16 v4, -0x4010000000000000L    # -1.0

    cmpl-double v2, v2, v4

    if-lez v2, :cond_0

    .line 122
    invoke-virtual/range {v18 .. v18}, Ljava/lang/Double;->floatValue()F

    move-result v2

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 125
    :cond_0
    invoke-virtual {v8}, Landroid/widget/Toast;->getView()Landroid/view/View;

    move-result-object v2

    move/from16 v0, v20

    move/from16 v1, v20

    invoke-virtual {v2, v12, v0, v12, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 128
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_1

    .line 129
    invoke-virtual {v8}, Landroid/widget/Toast;->getView()Landroid/view/View;

    move-result-object v2

    const/high16 v3, 0x40c00000    # 6.0f

    invoke-virtual {v2, v3}, Landroid/view/View;->setElevation(F)V

    .line 135
    .end local v9    # "backgroundColor":Ljava/lang/String;
    .end local v10    # "cornerRadius":I
    .end local v12    # "horizontalPadding":I
    .end local v14    # "opacity":D
    .end local v16    # "shape":Landroid/graphics/drawable/GradientDrawable;
    .end local v17    # "textColor":Ljava/lang/String;
    .end local v18    # "textSize":Ljava/lang/Double;
    .end local v19    # "toastTextView":Landroid/widget/TextView;
    .end local v20    # "verticalPadding":I
    :cond_1
    invoke-static {}, Lnl/xservices/plugins/Toast;->access$000()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 136
    move-object/from16 v0, p0

    iget-object v2, v0, Lnl/xservices/plugins/Toast$1;->this$0:Lnl/xservices/plugins/Toast;

    invoke-static {v2}, Lnl/xservices/plugins/Toast;->access$200(Lnl/xservices/plugins/Toast;)Landroid/view/ViewGroup;

    move-result-object v2

    new-instance v3, Lnl/xservices/plugins/Toast$1$1;

    move-object/from16 v0, p0

    invoke-direct {v3, v0}, Lnl/xservices/plugins/Toast$1$1;-><init>(Lnl/xservices/plugins/Toast$1;)V

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 189
    :goto_3
    new-instance v2, Lnl/xservices/plugins/Toast$1$3;

    int-to-long v4, v11

    const-wide/16 v6, 0x9c4

    move-object/from16 v3, p0

    invoke-direct/range {v2 .. v8}, Lnl/xservices/plugins/Toast$1$3;-><init>(Lnl/xservices/plugins/Toast$1;JJLandroid/widget/Toast;)V

    .line 192
    invoke-virtual {v2}, Lnl/xservices/plugins/Toast$1$3;->start()Landroid/os/CountDownTimer;

    move-result-object v2

    .line 189
    invoke-static {v2}, Lnl/xservices/plugins/Toast;->access$402(Landroid/os/CountDownTimer;)Landroid/os/CountDownTimer;

    .line 194
    move-object/from16 v0, p0

    iget-object v2, v0, Lnl/xservices/plugins/Toast$1;->this$0:Lnl/xservices/plugins/Toast;

    invoke-static {v2, v8}, Lnl/xservices/plugins/Toast;->access$102(Lnl/xservices/plugins/Toast;Landroid/widget/Toast;)Landroid/widget/Toast;

    .line 195
    invoke-virtual {v8}, Landroid/widget/Toast;->show()V

    .line 197
    new-instance v13, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v13, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 198
    .local v13, "pr":Lorg/apache/cordova/PluginResult;
    const/4 v2, 0x1

    invoke-virtual {v13, v2}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 199
    move-object/from16 v0, p0

    iget-object v2, v0, Lnl/xservices/plugins/Toast$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v2, v13}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 200
    .end local v13    # "pr":Lorg/apache/cordova/PluginResult;
    :goto_4
    return-void

    .line 77
    .end local v8    # "toast":Landroid/widget/Toast;
    .end local v11    # "hideAfterMs":I
    :cond_2
    const-string v2, "long"

    move-object/from16 v0, p0

    iget-object v3, v0, Lnl/xservices/plugins/Toast$1;->val$duration:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 78
    const/16 v11, 0xfa0

    .restart local v11    # "hideAfterMs":I
    goto/16 :goto_0

    .line 81
    .end local v11    # "hideAfterMs":I
    :cond_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lnl/xservices/plugins/Toast$1;->val$duration:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    .restart local v11    # "hideAfterMs":I
    goto/16 :goto_0

    .line 84
    :cond_4
    move-object/from16 v0, p0

    iget-object v2, v0, Lnl/xservices/plugins/Toast$1;->this$0:Lnl/xservices/plugins/Toast;

    iget-object v2, v2, Lnl/xservices/plugins/Toast;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    goto/16 :goto_1

    .line 91
    .restart local v8    # "toast":Landroid/widget/Toast;
    :cond_5
    const-string v2, "bottom"

    move-object/from16 v0, p0

    iget-object v3, v0, Lnl/xservices/plugins/Toast$1;->val$position:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 92
    const/16 v2, 0x51

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget v4, v0, Lnl/xservices/plugins/Toast$1;->val$addPixelsY:I

    rsub-int/lit8 v4, v4, 0x14

    invoke-virtual {v8, v2, v3, v4}, Landroid/widget/Toast;->setGravity(III)V

    goto/16 :goto_2

    .line 93
    :cond_6
    const-string v2, "center"

    move-object/from16 v0, p0

    iget-object v3, v0, Lnl/xservices/plugins/Toast$1;->val$position:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 94
    const/16 v2, 0x11

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget v4, v0, Lnl/xservices/plugins/Toast$1;->val$addPixelsY:I

    invoke-virtual {v8, v2, v3, v4}, Landroid/widget/Toast;->setGravity(III)V

    goto/16 :goto_2

    .line 96
    :cond_7
    move-object/from16 v0, p0

    iget-object v2, v0, Lnl/xservices/plugins/Toast$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    const-string v3, "invalid position. valid options are \'top\', \'center\' and \'bottom\'"

    invoke-virtual {v2, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_4

    .line 180
    :cond_8
    invoke-virtual {v8}, Landroid/widget/Toast;->getView()Landroid/view/View;

    move-result-object v2

    new-instance v3, Lnl/xservices/plugins/Toast$1$2;

    move-object/from16 v0, p0

    invoke-direct {v3, v0}, Lnl/xservices/plugins/Toast$1$2;-><init>(Lnl/xservices/plugins/Toast$1;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    goto/16 :goto_3
.end method
