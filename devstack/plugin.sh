#!/usr/bin/env bash
#
# DevStack Infinidat plugin
#

if (( $# == 0 )); then
    echo "Usage: $0 mode"
    echo "mode: {source,stack,unstack,clean}"
    exit 1
fi

MODE="$1"

if [[ "$MODE" == "stack" ]]; then
    if (( $# != 2 )); then
        echo "Usage: $0 stack phase"
        echo "phase: {pre-install,install,post-config,extra,test-config}"
        exit 1
    fi
    PHASE="$2"
fi

case "$MODE" in
source)
    ;;
stack)
    case "$PHASE" in
    pre-install)
        install_infinidat_dependencies
        ;;
    install)
        ;;
    post-config)
        configure_infinidat_cinder
        ;;
    extra)
        ;;
    test-config)
        configure_infinidat_tempest
        ;;
    *)
        echo "Unknown phase '$PHASE' for mode '$MODE'."
        exit 1
        ;;
    esac
    ;;
unstack)
    ;;
clean)
    uninstall_infinidat_dependencies
    ;;
*)
    echo "Unknown mode '$MODE'."
    exit 1
    ;;
esac
