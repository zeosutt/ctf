.class Lcom/mbppower/CameraPreview$1;
.super Ljava/lang/Object;
.source "CameraPreview.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mbppower/CameraPreview;->startCamera(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mbppower/CameraPreview;

.field final synthetic val$args:Lorg/json/JSONArray;


# direct methods
.method constructor <init>(Lcom/mbppower/CameraPreview;Lorg/json/JSONArray;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mbppower/CameraPreview;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/mbppower/CameraPreview$1;->this$0:Lcom/mbppower/CameraPreview;

    iput-object p2, p0, Lcom/mbppower/CameraPreview$1;->val$args:Lorg/json/JSONArray;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 18

    .prologue
    .line 81
    :try_start_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mbppower/CameraPreview$1;->this$0:Lcom/mbppower/CameraPreview;

    iget-object v15, v15, Lcom/mbppower/CameraPreview;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v15}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v15

    invoke-virtual {v15}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    invoke-virtual {v15}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v9

    .line 82
    .local v9, "metrics":Landroid/util/DisplayMetrics;
    const/4 v15, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mbppower/CameraPreview$1;->val$args:Lorg/json/JSONArray;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONArray;->getInt(I)I

    move-result v16

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-static {v15, v0, v9}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v15

    float-to-int v13, v15

    .line 83
    .local v13, "x":I
    const/4 v15, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mbppower/CameraPreview$1;->val$args:Lorg/json/JSONArray;

    move-object/from16 v16, v0

    const/16 v17, 0x1

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONArray;->getInt(I)I

    move-result v16

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-static {v15, v0, v9}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v15

    float-to-int v14, v15

    .line 84
    .local v14, "y":I
    const/4 v15, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mbppower/CameraPreview$1;->val$args:Lorg/json/JSONArray;

    move-object/from16 v16, v0

    const/16 v17, 0x2

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONArray;->getInt(I)I

    move-result v16

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-static {v15, v0, v9}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v15

    float-to-int v12, v15

    .line 85
    .local v12, "width":I
    const/4 v15, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mbppower/CameraPreview$1;->val$args:Lorg/json/JSONArray;

    move-object/from16 v16, v0

    const/16 v17, 0x3

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONArray;->getInt(I)I

    move-result v16

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-static {v15, v0, v9}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v15

    float-to-int v8, v15

    .line 86
    .local v8, "height":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mbppower/CameraPreview$1;->val$args:Lorg/json/JSONArray;

    const/16 v16, 0x4

    invoke-virtual/range {v15 .. v16}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 87
    .local v3, "defaultCamera":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mbppower/CameraPreview$1;->val$args:Lorg/json/JSONArray;

    const/16 v16, 0x5

    invoke-virtual/range {v15 .. v16}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v15

    invoke-static {v15}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    .line 88
    .local v10, "tapToTakePicture":Ljava/lang/Boolean;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mbppower/CameraPreview$1;->val$args:Lorg/json/JSONArray;

    const/16 v16, 0x6

    invoke-virtual/range {v15 .. v16}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v15

    invoke-static {v15}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    .line 89
    .local v4, "dragEnabled":Ljava/lang/Boolean;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mbppower/CameraPreview$1;->val$args:Lorg/json/JSONArray;

    const/16 v16, 0x7

    invoke-virtual/range {v15 .. v16}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v15

    invoke-static {v15}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    .line 91
    .local v11, "toBack":Ljava/lang/Boolean;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mbppower/CameraPreview$1;->this$0:Lcom/mbppower/CameraPreview;

    invoke-static {v15}, Lcom/mbppower/CameraPreview;->access$000(Lcom/mbppower/CameraPreview;)Lcom/mbppower/CameraActivity;

    move-result-object v15

    iput-object v3, v15, Lcom/mbppower/CameraActivity;->defaultCamera:Ljava/lang/String;

    .line 92
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mbppower/CameraPreview$1;->this$0:Lcom/mbppower/CameraPreview;

    invoke-static {v15}, Lcom/mbppower/CameraPreview;->access$000(Lcom/mbppower/CameraPreview;)Lcom/mbppower/CameraActivity;

    move-result-object v15

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v16

    move/from16 v0, v16

    iput-boolean v0, v15, Lcom/mbppower/CameraActivity;->tapToTakePicture:Z

    .line 93
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mbppower/CameraPreview$1;->this$0:Lcom/mbppower/CameraPreview;

    invoke-static {v15}, Lcom/mbppower/CameraPreview;->access$000(Lcom/mbppower/CameraPreview;)Lcom/mbppower/CameraActivity;

    move-result-object v15

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v16

    move/from16 v0, v16

    iput-boolean v0, v15, Lcom/mbppower/CameraActivity;->dragEnabled:Z

    .line 94
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mbppower/CameraPreview$1;->this$0:Lcom/mbppower/CameraPreview;

    invoke-static {v15}, Lcom/mbppower/CameraPreview;->access$000(Lcom/mbppower/CameraPreview;)Lcom/mbppower/CameraActivity;

    move-result-object v15

    invoke-virtual {v15, v13, v14, v12, v8}, Lcom/mbppower/CameraActivity;->setRect(IIII)V

    .line 97
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mbppower/CameraPreview$1;->this$0:Lcom/mbppower/CameraPreview;

    iget-object v15, v15, Lcom/mbppower/CameraPreview;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v15}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mbppower/CameraPreview$1;->this$0:Lcom/mbppower/CameraPreview;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/mbppower/CameraPreview;->access$100(Lcom/mbppower/CameraPreview;)I

    move-result v16

    invoke-virtual/range {v15 .. v16}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout;

    .line 98
    .local v2, "containerView":Landroid/widget/FrameLayout;
    if-nez v2, :cond_0

    .line 99
    new-instance v2, Landroid/widget/FrameLayout;

    .end local v2    # "containerView":Landroid/widget/FrameLayout;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mbppower/CameraPreview$1;->this$0:Lcom/mbppower/CameraPreview;

    iget-object v15, v15, Lcom/mbppower/CameraPreview;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v15}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v15

    invoke-virtual {v15}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v15

    invoke-direct {v2, v15}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 100
    .restart local v2    # "containerView":Landroid/widget/FrameLayout;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mbppower/CameraPreview$1;->this$0:Lcom/mbppower/CameraPreview;

    invoke-static {v15}, Lcom/mbppower/CameraPreview;->access$100(Lcom/mbppower/CameraPreview;)I

    move-result v15

    invoke-virtual {v2, v15}, Landroid/widget/FrameLayout;->setId(I)V

    .line 102
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v15, -0x1

    const/16 v16, -0x1

    move/from16 v0, v16

    invoke-direct {v1, v15, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 103
    .local v1, "containerLayoutParams":Landroid/widget/FrameLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mbppower/CameraPreview$1;->this$0:Lcom/mbppower/CameraPreview;

    iget-object v15, v15, Lcom/mbppower/CameraPreview;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v15}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v15

    invoke-virtual {v15, v2, v1}, Landroid/app/Activity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 106
    .end local v1    # "containerLayoutParams":Landroid/widget/FrameLayout$LayoutParams;
    :cond_0
    invoke-virtual {v11}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v15

    if-eqz v15, :cond_1

    .line 107
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mbppower/CameraPreview$1;->this$0:Lcom/mbppower/CameraPreview;

    iget-object v15, v15, Lcom/mbppower/CameraPreview;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v15}, Lorg/apache/cordova/CordovaWebView;->getView()Landroid/view/View;

    move-result-object v15

    const/16 v16, 0x0

    invoke-virtual/range {v15 .. v16}, Landroid/view/View;->setBackgroundColor(I)V

    .line 108
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mbppower/CameraPreview$1;->this$0:Lcom/mbppower/CameraPreview;

    iget-object v15, v15, Lcom/mbppower/CameraPreview;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v15}, Lorg/apache/cordova/CordovaWebView;->getView()Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/view/ViewGroup;

    invoke-virtual {v15}, Landroid/view/ViewGroup;->bringToFront()V

    .line 117
    :goto_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mbppower/CameraPreview$1;->this$0:Lcom/mbppower/CameraPreview;

    iget-object v15, v15, Lcom/mbppower/CameraPreview;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v15}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v15

    invoke-virtual {v15}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v6

    .line 118
    .local v6, "fragmentManager":Landroid/app/FragmentManager;
    invoke-virtual {v6}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v7

    .line 119
    .local v7, "fragmentTransaction":Landroid/app/FragmentTransaction;
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getId()I

    move-result v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mbppower/CameraPreview$1;->this$0:Lcom/mbppower/CameraPreview;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/mbppower/CameraPreview;->access$000(Lcom/mbppower/CameraPreview;)Lcom/mbppower/CameraActivity;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v7, v15, v0}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    .line 120
    invoke-virtual {v7}, Landroid/app/FragmentTransaction;->commit()I

    .line 125
    .end local v2    # "containerView":Landroid/widget/FrameLayout;
    .end local v3    # "defaultCamera":Ljava/lang/String;
    .end local v4    # "dragEnabled":Ljava/lang/Boolean;
    .end local v6    # "fragmentManager":Landroid/app/FragmentManager;
    .end local v7    # "fragmentTransaction":Landroid/app/FragmentTransaction;
    .end local v8    # "height":I
    .end local v9    # "metrics":Landroid/util/DisplayMetrics;
    .end local v10    # "tapToTakePicture":Ljava/lang/Boolean;
    .end local v11    # "toBack":Ljava/lang/Boolean;
    .end local v12    # "width":I
    .end local v13    # "x":I
    .end local v14    # "y":I
    :goto_1
    return-void

    .line 112
    .restart local v2    # "containerView":Landroid/widget/FrameLayout;
    .restart local v3    # "defaultCamera":Ljava/lang/String;
    .restart local v4    # "dragEnabled":Ljava/lang/Boolean;
    .restart local v8    # "height":I
    .restart local v9    # "metrics":Landroid/util/DisplayMetrics;
    .restart local v10    # "tapToTakePicture":Ljava/lang/Boolean;
    .restart local v11    # "toBack":Ljava/lang/Boolean;
    .restart local v12    # "width":I
    .restart local v13    # "x":I
    .restart local v14    # "y":I
    :cond_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mbppower/CameraPreview$1;->val$args:Lorg/json/JSONArray;

    const/16 v16, 0x8

    invoke-virtual/range {v15 .. v16}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v15

    invoke-virtual {v2, v15}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 113
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->bringToFront()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 122
    .end local v2    # "containerView":Landroid/widget/FrameLayout;
    .end local v3    # "defaultCamera":Ljava/lang/String;
    .end local v4    # "dragEnabled":Ljava/lang/Boolean;
    .end local v8    # "height":I
    .end local v9    # "metrics":Landroid/util/DisplayMetrics;
    .end local v10    # "tapToTakePicture":Ljava/lang/Boolean;
    .end local v11    # "toBack":Ljava/lang/Boolean;
    .end local v12    # "width":I
    .end local v13    # "x":I
    .end local v14    # "y":I
    :catch_0
    move-exception v5

    .line 123
    .local v5, "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method
