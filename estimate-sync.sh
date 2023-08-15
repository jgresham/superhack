#! /usr/bin/bash

export ETH_RPC_URL=http://localhost:8543
echo `cast block latest -f number`
T0=`cast block latest -f number` ; sleep 60 ; T1=`cast block latest -f number`
PER_MIN=`expr $T1 - $T0`
echo Blocks per minute: $PER_MIN
echo `cast block latest -f number`

if [ $PER_MIN -eq 0 ]; then
    echo Not synching or keeping up with head of the chain
    exit;
fi

# During that minute the head of the chain progressed by thirty blocks
# OP chains progress at 2 blocks per second, or 30 blocks per minute
PROGRESS_PER_MIN=`expr $PER_MIN - 30`
echo Progress \(blocks - 30 per minute\) per minute: $PROGRESS_PER_MIN
if [ $PER_MIN -eq 0 ]; then
    echo The node is only keeping up with the head of the chain at 30 blocks per minute, no more. Is your node already synced?
fi

# How many more blocks do we need?
HEAD=`cast block --rpc-url https://mainnet.base.org latest -f number`
BEHIND=`expr $HEAD - $T1` 
MINUTES=`expr $BEHIND / $PROGRESS_PER_MIN`
HOURS=`expr $MINUTES / 60`
echo Hours until sync completed: $HOURS

if [ $HOURS -gt 24 ] ; then
   DAYS=`expr $HOURS / 24`
   echo Days until sync complete: $DAYS
fi